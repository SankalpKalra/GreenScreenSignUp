//
//  GenderTableViewCell.swift
//  GreenSignUpScreenTableView
//
//  Created by Appinventiv on 22/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class GenderTableViewCell: UITableViewCell {

    @IBOutlet weak var GreyBg: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.GreyBg.layer.shadowColor = UIColor.black.cgColor
        self.GreyBg.layer.shadowOpacity = 0.5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
