//
//  AdminViewController.swift
//  KNOWURBASICSNEW
//
//  Created by Student016 on 27/11/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit

class AdminViewController: UIViewController {
    
    
    var nameC = ""
    override func viewDidLoad() {
        super.viewDidLoad()

          }
    
    @IBAction func backbutton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    

    @IBAction func CBUTTON(_ sender: UIButton)
    {
        nameC = (sender.titleLabel?.text)!
        performSegue(withIdentifier: "cl", sender: self)
    }
    
    @IBAction func cbutton(_ sender: UIButton) {
        nameC = (sender.titleLabel?.text)!
        performSegue(withIdentifier: "cpp", sender: self)
        
    }
    
    
    @IBAction func objcbutton(_ sender: UIButton) {
        nameC = (sender.titleLabel?.text)!
        performSegue(withIdentifier: "objc", sender: self)
        
    }
    
    
    @IBAction func swiftbuttton(_ sender: UIButton)
    {
        nameC = (sender.titleLabel?.text)!
        performSegue(withIdentifier: "swift", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var sg = segue.destination as! clanguageViewController
        sg.languageback = nameC
        print(nameC)
    }
}
