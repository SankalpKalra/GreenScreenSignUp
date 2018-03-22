//
//  BasicDetailsTableViewCell.swift
//  GreenSignUpScreenTableView
//
//  Created by Appinventiv on 22/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class BasicDetailsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var GreyBg: UIView!
    
        
   
    @IBOutlet weak var NameTextField: UITextField!
    
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.GreyBg.layer.shadowColor = UIColor.black.cgColor
        self.GreyBg.layer.shadowOpacity = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
   

}
