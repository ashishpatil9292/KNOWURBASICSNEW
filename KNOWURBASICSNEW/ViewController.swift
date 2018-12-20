//
//  ViewController.swift
//  KNOWURBASICSNEW
//
//  Created by Student016 on 19/11/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn

import SwiftKeychainWrapper


class ViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var alertlabel: UILabel!
    
    @IBOutlet weak var usernametext: UITextField!
    
    @IBOutlet weak var passwordtext: UITextField!
    // google logout button
    
    @IBAction func login(_ sender: UIButton) {

        if (usernametext.text?.isEmpty)! && (passwordtext.text?.isEmpty)!
        {
            alertcontroller(Usermessage: "please enter all fields")
            return
        }
        
        alertlabel.isHidden = true
        
        
        guard  let   userfinalid:String = KeychainWrapper.standard.string(forKey: "EMAILKEY1")
            else {
             
                return
        }

        guard  let   userfinalpass:String = KeychainWrapper.standard.string(forKey: "PASSKEY1")
            else {
                print("bb")
                return
        }
print(userfinalid)
        print(userfinalpass)
        
//    var fbid =    FBSDKAccessToken.current().userID
//        print(fbid)
//     
        
        if usernametext.text == "YASH" && passwordtext.text == "1234"
            
        {
            performSegue(withIdentifier: "admin", sender: self)
            alertcontroller(Usermessage: "Admin LOgin successfull")
        }



        else if usernametext.text ==  userfinalid  && passwordtext.text == userfinalpass
        {
            performSegue(withIdentifier: "user", sender: self)

        }
        //
       
        guard usernametext.text?.count != 0 else {
            alertlabel.isHidden = false
            alertlabel.text = "please enter Correct Email id"
            alertlabel.textColor = UIColor.red
            return
        }
        guard passwordtext.text?.count != 0 else {
            alertlabel.isHidden = false
            alertlabel.text = "please enter Correct Password"
            alertlabel.textColor = UIColor.red
return
        }
        guard isValidEmail(testStr: usernametext.text!)
        else
        {
            alertlabel.isHidden = false
            alertlabel.text = "please enter Correct EmailId"
            alertlabel.textColor = UIColor.red
            return
            
            
        }
        
       
    }
    func isValidEmail(testStr:String) -> Bool
    {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: testStr)
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //facebook login button
                let loginbutton:FBSDKLoginButton = FBSDKLoginButton();
                loginbutton.frame = CGRect(x: 120, y: 550, width: 167, height: 35)
                loginbutton.readPermissions = ["public_profile","email"]
       loginbutton.addTarget(self, action: #selector(userhome), for: .touchUpInside)
                self.view.addSubview(loginbutton)
        
        
        if FBSDKAccessToken.current() != nil{
                    let next1 = self.storyboard?.instantiateViewController(withIdentifier: "next1") as! languageview
                    self.navigationController?.pushViewController(next1, animated: true)
               print("user is logged successfully")
            
        }
        //googleloginbutton
        let googlesgninbutton = GIDSignInButton()
        googlesgninbutton.frame = CGRect(x: 120, y: 600, width: 167, height: 25)
       
        view.addSubview(googlesgninbutton)
        GIDSignIn.sharedInstance().uiDelegate = self

        }
   @objc
    func userhome()
    {
        let next1 = self.storyboard?.instantiateViewController(withIdentifier: "next1") as! languageview
        self.navigationController?.pushViewController(next1, animated: true)
        
        
    }
    
   
    
    func alertcontroller(Usermessage:String) -> Void
    {
        DispatchQueue.main.async
            {
                let alert = UIAlertController(title: "Alert", message: Usermessage, preferredStyle: .alert)
                
                let okaction = UIAlertAction(title: "OK", style: .default)
                {
                    (action:UIAlertAction)in
                    DispatchQueue.main.async
                        {
                            self.dismiss(animated: true, completion: nil)
                    }
                }
                alert.addAction(okaction)
                self.present(alert, animated: true, completion: nil)
        }
        
    }
}
