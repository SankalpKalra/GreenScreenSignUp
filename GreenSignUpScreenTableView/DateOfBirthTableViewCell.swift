//
//  DateOfBirthTableViewCell.swift
//  GreenSignUpScreenTableView
//
//  Created by Appinventiv on 22/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class DateOfBirthTableViewCell: UITableViewCell,UITextFieldDelegate {
    
    @IBOutlet weak var date: UITextField!

    @IBOutlet weak var month: UITextField!
    
    @IBOutlet weak var year: UITextField!
    
    @IBOutlet weak var grey: UIView!
    @IBOutlet weak var DateOfBirthLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        date.delegate=self
        month.delegate=self
        year.delegate=self
        
       self.grey.layer.shadowColor = UIColor.black.cgColor
        self.grey.layer.shadowOpacity = 0.5
    }

    
}
extension DateOfBirthTableViewCell{
    
    func isDateValidInput(Input:String) -> Bool {
        let RegEx = "([1-2][0-9]|[3][0-1]|[1-9])"
        if Input.count > 2 {return false}
        let test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return test.evaluate(with: Input)
    }
    
    func isMonthValidInput(Input:String) -> Bool {
        let RegEx = "([1][0-2]|[0][1-9]|[1-9])"
        if Input.count > 2 {return false}
        let test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return test.evaluate(with: Input)
    }
    
    func isYearValidInput(Input:String) -> Bool {
        let RegEx = "([1-9][0-9]{4}$)"
        let test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return test.evaluate(with: Input)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       
        if textField==date
        {
            let alert = UIAlertController(title: "* Cannot have date of this type ", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            
            let table: UITableView = self.superview! as! UITableView
            let mainView = table.superview!
            let mainViewController = mainView.window?.rootViewController

            let text = textField.text!
            
            if !isDateValidInput(Input: text)
            {
                mainViewController?.present(alert, animated: true, completion: nil)
            }
        }
        
        if textField==month
        {
            let alert = UIAlertController(title: "* Cannot have month of this type ", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            
            let table: UITableView = self.superview! as! UITableView
            let mainView = table.superview!
            let mainViewController = mainView.window?.rootViewController
            
            let text = textField.text!
            
            if !isMonthValidInput(Input: text)
            {
                mainViewController?.present(alert, animated: true, completion: nil)
            }
        }
        
        if textField==year
        {
            let alert = UIAlertController(title: "* Cannot have year of this type ", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            
            let table: UITableView = self.superview! as! UITableView
            let mainView = table.superview!
            let mainViewController = mainView.window?.rootViewController
            
            let text = textField.text!
            
            if !isYearValidInput(Input: text)
            {
                mainViewController?.present(alert, animated: true, completion: nil)
            }
        }
        
       return true
    }
}

