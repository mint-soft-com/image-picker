//
//  AVPreviewView.swift
//  ExampleApp
//
//  Created by Peter Stajger on 27/03/17.
//  Copyright © 2017 Peter Stajger. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

enum VideoDisplayMode {
    /// Preserve aspect ratio, fit within layer bounds.
    case aspectFit
    /// Preserve aspect ratio, fill view bounds.
    case aspectFill
    ///Stretch to fill layer bounds
    case resize
}

///
/// A view whose layer is AVCaptureVideoPreviewLayer so it's used for previewing
/// output from a capture session.
///
class AVPreviewView: UIView {
    
    deinit {
        log("deinit: \(String(describing: self))")
    }
    
    var previewLayer: AVCaptureVideoPreviewLayer {
        return layer as! AVCaptureVideoPreviewLayer
    }
    
    var session: AVCaptureSession? {
        get { return previewLayer.session }
        set { previewLayer.session = newValue }
    }
    
    var displayMode: VideoDisplayMode = .aspectFill {
        didSet { applyVideoDisplayMode() }
    }
    
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyVideoDisplayMode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyVideoDisplayMode()
    }
    
    // MARK: Private Methods
    
    private func applyVideoDisplayMode() {
        switch displayMode {
        case .aspectFill:    previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        case .aspectFit:    previewLayer.videoGravity = AVLayerVideoGravityResizeAspect
        case .resize:       previewLayer.videoGravity = AVLayerVideoGravityResize
        }
    }
}
