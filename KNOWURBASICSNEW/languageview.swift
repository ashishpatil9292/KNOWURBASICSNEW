//
//  languageview.swift
//  KNOWURBASICSNEW
//
//  Created by Student016 on 04/12/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit

class languageview: UIViewController {
    var namec:String?
    override func viewDidLoad() {
        super.viewDidLoad()


       
    }

    @IBAction func cbutton(_ sender: UIButton) {
namec = sender.titleLabel?.text
        performSegue(withIdentifier: "C", sender: self)
    }
    
    @IBAction func cppbutton(_ sender: UIButton) {
         namec = sender.titleLabel?.text
        performSegue(withIdentifier: "CPP", sender: self)
        
    }
    
    @IBAction func objc(_ sender: UIButton) {
        namec = sender.titleLabel?.text
        performSegue(withIdentifier: "OBJC", sender: self)
        

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sg = segue.destination as! USERFINalViewController
        sg.langidf = namec!
        print("lagid =\(namec)")
    }
    
    @IBAction func swift(_ sender: UIButton) {
        namec = sender.titleLabel?.text
        performSegue(withIdentifier: "SWIFT", sender: self)
        
    }
    
}
