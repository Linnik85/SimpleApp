//
//  ALSalonTableViewCell.swift
//  SimpleApp
//
//  Created by Линник Александр on 11.09.16.
//  Copyright © 2016 Alex Linnik. All rights reserved.
//

import UIKit
import SDWebImage

class ALSalonTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    func initWithSalon (salon:ALSalon) {
        self.urlLabel.text = salon.website
        self.name.text = salon.name
        let url = NSURL(string: salon.originProfileUrl)
        self.profileImage.sd_setImageWithURL(url)
    }
}
