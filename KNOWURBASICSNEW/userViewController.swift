//
//  userViewController.swift
//  KNOWURBASICSNEW
//
//  Created by Student016 on 27/11/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit
import GoogleSignIn
import SwiftKeychainWrapper
import FBSDKLoginKit
class userViewController: UIViewController {
   
    
  
    var lagguageid = ""
    var loginmanager = FBSDKLoginManager()
    
    @IBOutlet weak var namelabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    
    
    @IBAction func logout(_ sender: UIButton) {
 KeychainWrapper.standard.removeObject(forKey: "EMAILKEY")
        KeychainWrapper.standard.removeObject(forKey: "PASSKEY")
          GIDSignIn.sharedInstance().signOut()
//        FBSDKLoginManager.logOut(FBSDKLoginManager)
loginmanager.logOut()

        let signinpage = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window?.rootViewController = signinpage
        
        
    }
   
    
    
}
