//
//  registerViewController.swift
//  KNOWURBASICSNEW
//
//  Created by Student016 on 27/11/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit
import Security
import SwiftKeychainWrapper
//var userfinalid:String?
//var userfinalpass:String?
var EMAIL:String?
var Pass:String?
var first:String?
class registerViewController: UIViewController {
    
    @IBOutlet weak var firstname: UITextField!
    
    @IBOutlet weak var lastname: UITextField!
    
    @IBOutlet weak var password2text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBOutlet weak var alrtlabel: UILabel!
    @IBAction func backgrntap(_ sender: UIControl) {
        EMAILTEXT.resignFirstResponder()
        PASSWORDTEXT.resignFirstResponder()
    }
    @IBOutlet weak var EMAILTEXT: UITextField!
    
    
    @IBOutlet weak var PASSWORDTEXT: UITextField!
    
    @IBAction func register(_ sender: UIButton) {
        
        alrtlabel.isHidden = true
        
        first = firstname.text
        
        
        EMAIL = EMAILTEXT.text
        Pass = PASSWORDTEXT.text
      
    if (firstname.text?.isEmpty)! ||
            (lastname.text?.isEmpty)! ||
        (EMAILTEXT.text?.isEmpty)! ||
            (password2text.text?.isEmpty)! ||
            (PASSWORDTEXT.text?.isEmpty)!
    {

//        alrtlabel.isHidden = false
//        alrtlabel.text = "please enter all fields"
//        alrtlabel.textColor = UIColor.red
//        return

        
        alertcontroller(Usermessage: "please enter all fields")
        }
        print("email = \(EMAIL!),pasword = \(Pass!)")
      
        
        let userId = KeychainWrapper.standard.set(EMAILTEXT.text!, forKey: "EMAILKEY")
        let userId1 = KeychainWrapper.standard.set(EMAILTEXT.text!, forKey: "EMAILKEY1")
        
        let userpass = KeychainWrapper.standard.set(PASSWORDTEXT.text!, forKey: "PASSKEY")
        let userpass1 = KeychainWrapper.standard.set(PASSWORDTEXT.text!, forKey: "PASSKEY1")
        
        guard  let userfinalid:String = KeychainWrapper.standard.string(forKey: "EMAILKEY")
        else{
            print("a")
            return
        }
      
        guard  let   userfinalpass:String = KeychainWrapper.standard.string(forKey: "PASSKEY")
            else {
            print("b")
                return
        }
        print("userid =\(userfinalid)")
        print("userpass = \(userfinalpass)")
        
        
        //password matching
        
        if (PASSWORDTEXT.text != password2text.text)
        {
            alertcontroller(Usermessage: "Password do not match")
        return
        }
      performSegue(withIdentifier: "userhomepage", sender: self)
        
        guard isValidEmail(testStr: EMAILTEXT.text!)
            else{

                alertcontroller(Usermessage: "Enter valid Email")

                return
        }

        
        
        
//        guard isValidEmail(testStr: EMAILTEXT.text!)
//            else
//        {
//            alrtlabel.isHidden = false
//            alrtlabel.text = "please enter Correct EmailId"
//            alrtlabel.textColor = UIColor.red
//            return
//        }
        
        
//        let check = isValidEmail(testStr: EMAILTEXT.text!)
//        guard check != false else {
//            alrtlabel.isHidden = false
//            alrtlabel.text = "Enter proper email address"
//            alrtlabel.textColor = UIColor.red
//            return
//        }
//
//        guard  firstname.text?.count != 0 else
//        {
//            alrtlabel.isHidden = false
//            alrtlabel.text = "please Enter first Name"
//            alrtlabel.textColor = UIColor.red
//            return
//        }
//
//        guard  lastname.text?.count != 0 else
//        {
//            alrtlabel.isHidden = false
//            alrtlabel.text = "please Enter last Name"
//            alrtlabel.textColor = UIColor.red
//            return
//        }
//
//
//        guard  EMAILTEXT.text?.count != 0 else
//        {
//            alrtlabel.isHidden = false
//            alrtlabel.text = "please Enter EmilId"
//            alrtlabel.textColor = UIColor.red
//            return
//        }
//        guard  PASSWORDTEXT.text?.count != 0 else
//        {
//            alrtlabel.isHidden = false
//            alrtlabel.text = "please Enter password"
//            alrtlabel.textColor = UIColor.red
//            return
//        }
//        guard  password2text.text?.count != 0 else
//        {
//            alrtlabel.isHidden = false
//            alrtlabel.text = "please Enter password"
//            alrtlabel.textColor = UIColor.red
//            return
//        }
//
        
//        guard PASSWORDTEXT.text != password2text.text
//        else
//        {
//            alrtlabel.isHidden = false
//            alrtlabel.text = "password do not match"
//            alrtlabel.textColor = UIColor.red
//            return
//        }

    
//
//        let alertreg = UIAlertController(title: "successfully registerd", message: "hi", preferredStyle: .alert)
//        let okaction1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
//            let next  = self.storyboard?.instantiateViewController(withIdentifier: "userViewController") as! userViewController
//            self.navigationController?.pushViewController(next, animated: true)
//        }
//    alertreg.addAction(okaction1)
//    self.present(alertreg,animated: true, completion: nil)
    }
    
    @IBAction func backbutton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
   
    func isValidEmail(testStr:String) -> Bool
    {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: testStr)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sg = segue.destination as! userViewController
        sg.lagguageid = first!
        print(first!)
    }
    
    func alertcontroller(Usermessage:String) -> Void
        {
   
            let alert = UIAlertController(title: "Alert", message: Usermessage, preferredStyle: .alert)

            let okaction = UIAlertAction(title: "OK", style: .default)
        {
            (action:UIAlertAction)in
        }
            alert.addAction(okaction)
            self.present(alert, animated: true, completion: nil)
}
}
