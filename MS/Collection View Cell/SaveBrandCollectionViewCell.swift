//  SaveBrandCollectionViewCell.swift
//  MS
//  Created by Ranjeet Raushan on 15/08/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit

class SaveBrandCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectimage: UIImageView!{
    
        didSet{
            collectimage.layer.cornerRadius = self.frame.height / 12.0
            collectimage.layer.masksToBounds = true
        }
    }
}
