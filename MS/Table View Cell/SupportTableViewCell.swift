//  SupportTableViewCell.swift
//  MS
//  Created by Ranjeet Raushan on 15/08/20.
//  Copyright © 2020 Ranjeet Raushan. All rights reserved.

import UIKit
import Foundation

class SupportTableViewCell: UITableViewCell {

    @IBOutlet weak var supportimageView: UIImageView!
        {
        didSet{
            supportimageView.layer.cornerRadius = self.frame.height / 12.0
            supportimageView.layer.masksToBounds = true
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
