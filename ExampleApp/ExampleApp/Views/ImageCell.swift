//
//  ImageCell.swift
//  ExampleApp
//
//  Created by Peter Stajger on 07/09/2017.
//  Copyright © 2017 Inloop. All rights reserved.
//

import Foundation
import UIKit
import ImagePicker

class ImageCell : UICollectionViewCell, ImagePickerAssetCell {
    
    deinit {
        print("deinit: \(self.classForCoder)")
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    var representedAssetIdentifier: String?
    
    @IBOutlet weak var subtypeImageView: UIImageView!
    @IBOutlet weak var selectedImageView: UIImageView!
    
    override var isSelected: Bool {
        didSet {
            selectedImageView.isHidden = !isSelected
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subtypeImageView.backgroundColor = UIColor.clear
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        subtypeImageView.image = nil
    }
    
}
