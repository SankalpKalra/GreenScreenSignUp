//
//  ViewController.swift
//  GreenSignUpScreenTableView
//
//  Created by Appinventiv on 22/02/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableViewOutlet: UITableView!
    var expand = false
    var expand1 = false
    
    var dataDictionary:[String:String] = [:]
    
    
    @IBOutlet weak var GreenDotBasicDetailsView: UIView!
    @IBOutlet weak var GreenDotPassengerDetailsView: UIView!
    @IBOutlet weak var GreenDotAddCreditCardView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewOutlet.delegate=self
        self.tableViewOutlet.dataSource=self
        GreenDotBasicDetailsView.layer.cornerRadius=self.GreenDotBasicDetailsView.frame.height/2
        
        GreenDotPassengerDetailsView.layer.cornerRadius=self.GreenDotPassengerDetailsView.frame.height/2
        
        GreenDotAddCreditCardView.layer.cornerRadius=self.GreenDotAddCreditCardView.frame.height/2
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat{
        return (section == 2) ? 5 : 60
    }

    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        
        if section==0
        {
            let subview = UIView(frame: CGRect(x: 19, y: 0, width: tableView.frame.size.width - 38, height: 60))
            subview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            //view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            subview.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            subview.layer.shadowOpacity = 0.5
            view.addSubview(subview)
            
                let button = UIButton(frame: CGRect(x:tableView.frame.size.width-70, y: 10, width: 30, height: 30))
            button.setImage(#imageLiteral(resourceName: "arrow"), for: .normal )
            
//            UIView.animate(withDuration: 1, animations: { () -> Void in
//                if self.expand{
//                    self.Button.transform = .identity
//                }
//                else{
//                    cell.button.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi*0.999))
//                }
//            })
            
            button.addTarget(self, action: #selector(clickAction) , for:.touchUpInside)
            view.addSubview(button)
            
            let label = UILabel(frame: CGRect(x: 29, y: 20, width:300, height: 20))
            label.text = "Basic Details"
            label.textColor = UIColor.black
            
            view.addSubview(label)
        }
            
            
        else if section==1{
            
            let subview = UIView(frame: CGRect(x: 19, y: 0, width: tableView.frame.size.width - 38, height: 60))
            subview.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            //view.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            subview.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            subview.layer.shadowOpacity = 0.5
            view.addSubview(subview)
            
            let button1=UIButton(frame: CGRect(x:tableView.frame.size.width-70, y: 10, width: 30, height: 30))
            
            button1.setImage(#imageLiteral(resourceName: "arrow"), for: .normal )
            button1.addTarget(self, action: #selector(clickAction1) , for:.touchUpInside)
            view.addSubview(button1)
            
            
            let label = UILabel(frame: CGRect(x: 29, y: 20, width:300, height: 20))
            label.text = "Emergency Details"
            label.textColor = UIColor.black
            view.addSubview(label)
        }
        
        return view
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 70
    }
    
    @objc func clickAction(sender:UIButton!)
    {
        self.view.endEditing(true)
        self.expand = !self.expand
        self.tableViewOutlet.reloadData()
    }
    
    
    @objc func clickAction1(sender:UIButton!)
    {
        self.view.endEditing(true)
        self.expand1 = !self.expand1
        self.tableViewOutlet.reloadData()
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section==0
        {
            return expand ? 0 : 4
        }
        else if section==1{
            
            return expand1 ? 2 : 0
        }
        else{
            return 1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
            
        case 0:
            switch indexPath.row
            {
            case 0:
                
                let cell=tableView.dequeueReusableCell(withIdentifier: "BasicDetailsCell", for: indexPath) as! BasicDetailsTableViewCell
                cell.NameTextField.placeholder="First name"
                cell.NameTextField.delegate=self
                
                
                if  let name = dataDictionary["fname"], !name.isEmpty{
                    cell.NameTextField.text = dataDictionary["fname"]!
                }
                else
                {
                    cell.NameTextField.text = ""
                }
                
                return cell
                
            case 1:
                
                
                let cell=tableView.dequeueReusableCell(withIdentifier: "BasicDetailsCell", for: indexPath) as! BasicDetailsTableViewCell
                cell.NameTextField.placeholder="Last name"
                cell.NameTextField.delegate=self
                
                if dataDictionary["lname"] != nil{
                    cell.NameTextField.text = dataDictionary["lname"]!
                }
                else
                {
                    cell.NameTextField.text = ""
                }
                
                return cell
                
            case 2:
                let cell=tableView.dequeueReusableCell(withIdentifier: "DateOfBirthCell", for: indexPath) as! DateOfBirthTableViewCell
                cell.date.placeholder="dd"
              
                return cell
                
            default:
                let cell=tableView.dequeueReusableCell(withIdentifier: "GenderCell", for: indexPath) as! GenderTableViewCell
                return cell
                
            }
            
        case 1:
            switch indexPath.row
            {
            case 0:
                
                let cell=tableView.dequeueReusableCell(withIdentifier: "BasicDetailsCell", for: indexPath) as! BasicDetailsTableViewCell
                
                cell.NameTextField.placeholder="Father name"
                
                if dataDictionary["FatherName"] != nil{
                    cell.NameTextField.text = dataDictionary["FatherName"]!
                }
                else
                {
                    cell.NameTextField.text = ""
                }
                cell.NameTextField.delegate=self
                return cell
                
            default:
                let cell=tableView.dequeueReusableCell(withIdentifier: "BasicDetailsCell", for: indexPath) as! BasicDetailsTableViewCell
                
                cell.NameTextField.placeholder="Contact No."
                
                if dataDictionary["Contact"] != nil{
                    cell.NameTextField.text = dataDictionary["Contact"]!
                }
                else
                {
                    cell.NameTextField.text = ""
                }
                cell.NameTextField.delegate=self
                return cell
                
                
            }
        case 2: /// Section 2
            let cell=tableView.dequeueReusableCell(withIdentifier: "ButtonTableViewCell", for: indexPath) as! ButtonTableViewCell
            return cell
        default: return UITableViewCell()
        }
        
    }
    
    
}

extension ViewController:UITextFieldDelegate
{
    
    
    func isValidInput(Input:String) -> Bool {
        let RegEx = "([A-Z][a-zA-Z]*)"
        let test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return test.evaluate(with: Input)
    }
    
    
    func isValidInputNumber(Input:String) -> Bool {
        let RegEx = "([0-9]*)"
        if Input.count != 10{return false}
        let test = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return test.evaluate(with: Input)
    }
    
    
    public func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        
        
        guard let indexPath = self.tableViewOutlet.indexPath(forItem: textField) else {return true}
        
        if indexPath.section == 0 && indexPath.row == 0{
            let alert = UIAlertController(title: "* First Name can only have Letters A-Za-z", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            let text = textField.text!
            if !isValidInput(Input: text)
            {
                self.present(alert, animated: true, completion: nil)
            }
            
            
            dataDictionary["fname"]=textField.text
        }
        
        else if indexPath.section==0 && indexPath.row == 1{
            let alert = UIAlertController(title: "* Last Name can only have Letters A-Za-z", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            let text = textField.text!
            if !isValidInput(Input: text)
            {
                self.present(alert, animated: true, completion: nil)
            }
            dataDictionary["lname"]=textField.text
        }
        
        else if indexPath.section==1 && indexPath.row == 0{
            let alert = UIAlertController(title: "* Father Name can only have Letters A-Za-z", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            let text = textField.text!
            if !isValidInput(Input: text)
            {
                self.present(alert, animated: true, completion: nil)
            }
            dataDictionary["FatherName"]=textField.text
        }
        
        else if indexPath.section==1 && indexPath.row == 1{
            let alert = UIAlertController(title: "* Contact Number can only have Numbers 0-9 and only 10 digits", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
            let text = textField.text!
            if !isValidInputNumber(Input: text)
            {
                self.present(alert, animated: true, completion: nil)
            }
            dataDictionary["Contact"]=textField.text
        }
        
        return true
    }
    
    
    
}

//extension UIView {
//
//    func getTableviewcell() -> UITableViewCell? {
//
//        var view = self
//        while view.isKind(of: UITableViewCell.self) {
//            view = view.superview!
//        }
//
//        return view as? UITableViewCell
//    }
//}

extension UITableView  {
    func indexPath(forItem item: Any) -> IndexPath? {
        
        let itemPosition: CGPoint = (item as AnyObject).convert(CGPoint.zero, to: self)
        return self.indexPathForRow(at: itemPosition)
        
    }
}


