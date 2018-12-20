//
//  USERFINalViewController.swift
//  KNOWURBASICSNEW
//
//  Created by Student016 on 05/12/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit
import CoreData
class USERFINalViewController: UIViewController {
    var delegate:AppDelegate?
    var count = 0
    var langidf=""
    var answ1=""
    var answ2=""
    var answ3=""
    var answ4=""
var showans = ""
    var flag = 0
    var totlscore = [String]()
    var s = 0
    
    
    @IBOutlet weak var QUENUMBER: UILabel!
    
    @IBOutlet weak var QUESTIONTEXT: UILabel!
    
    @IBOutlet weak var ANSWER1: UILabel!
    
    
    @IBOutlet weak var ANSWER2: UILabel!
    
    
    @IBOutlet weak var ANSWER3: UILabel!
    
    @IBOutlet weak var ANSWER4: UILabel!
   
    @IBOutlet weak var SOANS: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      alertlabel.isHidden = true
        
        QUESTIONTEXT.layer.cornerRadius = 10
        QUESTIONTEXT.layer.borderWidth = 1
        QUESTIONTEXT.layer.borderColor = UIColor.gray.cgColor
        
        QUENUMBER.layer.cornerRadius = 10
        QUENUMBER.layer.borderWidth = 1
        QUENUMBER.layer.borderColor = UIColor.gray.cgColor
        
        
        
        SOANS.layer.cornerRadius = 10
        SOANS.layer.borderWidth = 1
        SOANS.layer.borderColor = UIColor.gray.cgColor
        
        ANSWER1.layer.cornerRadius = 10
        ANSWER1.layer.borderWidth = 1
        ANSWER1.layer.borderColor = UIColor.gray.cgColor
        
        ANSWER2.layer.cornerRadius = 10
        ANSWER2.layer.borderWidth = 1
        ANSWER2.layer.borderColor = UIColor.gray.cgColor
        
        
        ANSWER3.layer.cornerRadius = 10
        ANSWER3.layer.borderWidth = 1
        ANSWER3.layer.borderColor = UIColor.gray.cgColor
        
        ANSWER4.layer.cornerRadius = 10
        ANSWER4.layer.borderWidth = 1
        ANSWER4.layer.borderColor = UIColor.gray.cgColor
        
        score.text = "Total score = \(String( totlscore.count))"
        score.textColor = UIColor.orange
        
        finalanswer.isHidden = true
        print("lanugaeid = \(langidf)")
        
        delegate = UIApplication.shared.delegate as? AppDelegate
        let context:NSManagedObjectContext = delegate!.persistentContainer.viewContext
        let fetchRequest : NSFetchRequest<Language> = Language.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "langid = %@", langidf)
        fetchRequest.returnsObjectsAsFaults = false
        do{
            List = try context.fetch(fetchRequest)
            let result = List[count]as! Language
            
            let qustins = result.querel?.allObjects as! [Question]
            
            for res in qustins
            {
                
                
                print("res=\(res.answer1)")
                print("question = \(qustins)")
                
                answ1 = res.answer1!
                answ2 = res.answer2!
                answ3 = res.answer3!
                answ4 = res.answer4!
                showans = res.showanswer!
                
                QUENUMBER.text = String( res.questionno)
                QUESTIONTEXT.text = res.quetext
                ANSWER1.text = answ1
                ANSWER2.text = answ2
                ANSWER3.text = answ3
                ANSWER4.text = answ4
                finalanswer.text =  showans
                
                
                print("answ1 = \(answ1)")
                print("answ2 = \(answ2)")
                print("answ3 = \(answ3)")
                print("answ4 = \(answ4)")
                print("showan = \(showans)")
                }
            }
            catch
        {
            print(error.localizedDescription)
        }
    }
    @IBOutlet weak var backbutton: UIButton!
    
    @IBAction func backbtn(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var finalanswer: UILabel!
    
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var alertlabel: UILabel!
 
    
    
    @IBAction func showanswer(_ sender: UIButton)
    {
        
      if flag == 1
        {
            finalanswer.isHidden = false
            UIView.transition(with: self.view, duration: 2, options:  UIViewAnimationOptions.transitionCrossDissolve, animations: {
                self.finalanswer.text = self.showans
            }) { (finished:Bool)->() in
                self.finalanswer.text = self.showans
        }
        }
        
        if flag == 2
        {
            finalanswer.isHidden = false
            UIView.transition(with: self.view, duration: 2, options:  UIViewAnimationOptions.transitionCrossDissolve, animations: {
                self.finalanswer.text = self.showans
            }) { (finished:Bool)->() in
                self.finalanswer.text = self.showans
            }
        }
      
    }
   
            
    
            
    @IBAction func ANSWERBT(_ sender: UIButton) {
        
        
       
        
        
        if sender.currentTitle == "A"
        {
          
            if showans == answ1
            {
                s += 1
                totlscore.append(String( s))
            sender.backgroundColor = UIColor.green
            sender.setTitleColor(UIColor.black, for: .normal)
            sender.isSelected = true
            
                alertlabel.isHidden = false
                alertlabel.text = "Your answer is Right"
                flag = 1
                alertlabel.textColor = UIColor.red
                
                
                UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                    sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                    sender.isSelected = !sender.isSelected
                }) { (success) in
                    UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations:
                        {
                        sender.transform = .identity
                    }, completion: nil)
                    self.button2.isUserInteractionEnabled = false
                    self.button3.isUserInteractionEnabled = false
                    self.button4.isUserInteractionEnabled = false
                    
                }
            }
               else
          {
             alertlabel.isHidden = false
            alertlabel.text = "Your answer is Wrong"
            alertlabel.textColor = UIColor.red
            flag = 2
            sender.backgroundColor = UIColor.red
            sender.setTitleColor(UIColor.black, for: .normal)
            self.button2.isUserInteractionEnabled = false
            self.button3.isUserInteractionEnabled = false
            self.button4.isUserInteractionEnabled = false
            
         }
            
        }
        else if sender.currentTitle == "B"
        {
            if showans == answ2
            {
                s += 1
                totlscore.append(String( s))
                alertlabel.isHidden = false
                alertlabel.text = "Your answer is Right"
                alertlabel.textColor = UIColor.green
                
                sender.backgroundColor = UIColor.green
                sender.setTitleColor(UIColor.black, for: .normal)
                   flag = 1
                sender.isSelected = true
                UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                    sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                    sender.isSelected = !sender.isSelected
                }) { (success) in
                    UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
                        sender.transform = .identity
                    }, completion: nil)

                }
        button1.isUserInteractionEnabled = false
        button3.isUserInteractionEnabled = false
        button4.isUserInteractionEnabled = false
        
                }
                
            else
            { flag = 2
                alertlabel.isHidden = false
                alertlabel.text = "Your answer is Wrong"
                alertlabel.textColor = UIColor.red
                
                sender.backgroundColor = UIColor.red
                sender.setTitleColor(UIColor.black, for: .normal)
                button1.isUserInteractionEnabled = false
                button3.isUserInteractionEnabled = false
                button4.isUserInteractionEnabled = false
                
            }
            
        }
    else if sender.currentTitle == "C"
        {
            if showans == answ3
            {
                s += 1
                totlscore.append(String( s))
                alertlabel.isHidden = false
                alertlabel.text = "Your answer is Right"
                alertlabel.textColor = UIColor.green
                sender.backgroundColor = UIColor.green
                sender.setTitleColor(UIColor.black, for: .normal)
                sender.isSelected = true
                   flag = 1
                UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                    sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                    sender.isSelected = !sender.isSelected
                }) { (success) in
                    UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
                        sender.transform = .identity
                    }, completion: nil)

//
                }
                button1.isUserInteractionEnabled = false
                button2.isUserInteractionEnabled = false
                button4.isUserInteractionEnabled = false
                
                }
               
            else
            {flag = 2
                alertlabel.isHidden = false
                alertlabel.text = "Your answer is Wrong"
                alertlabel.textColor = UIColor.red
                
                sender.backgroundColor = UIColor.red
                sender.setTitleColor(UIColor.black, for: .normal)
            button1.isUserInteractionEnabled = false
            button2.isUserInteractionEnabled = false
            button4.isUserInteractionEnabled = false
            
            }
            
        }
    
        else if sender.currentTitle == "D"
        {
            if showans == answ4
            {
                s += 1
                totlscore.append(String( s))
                alertlabel.isHidden = false
                alertlabel.text = "Your answer is Right"
                alertlabel.textColor = UIColor.green
                
                sender.backgroundColor = UIColor.green
                sender.setTitleColor(UIColor.black, for: .normal)
                flag = 1
                 sender.isSelected = true
                UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                    sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                    sender.isSelected = !sender.isSelected
                }) { (success) in
                    UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveEaseInOut, animations: {
                        sender.transform = .identity
                    }, completion: nil)
                    
                   
                }
                button1.isUserInteractionEnabled = false
                button2.isUserInteractionEnabled = false
                button3.isUserInteractionEnabled = false
                
               }
            else
            { flag = 2
                alertlabel.isHidden = false
                alertlabel.text = "Your answer is Wrong"
                alertlabel.textColor = UIColor.red
                
                sender.backgroundColor = UIColor.red
                sender.setTitleColor(UIColor.black, for: .normal)
                button1.isUserInteractionEnabled = false
                button2.isUserInteractionEnabled = false
                button3.isUserInteractionEnabled = false
                
           }
        }
    
    }
    
    
    
    
    
   
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    
    @IBOutlet weak var button4: UIButton!
    

        
    
    
    

    @IBAction func nextbutton(_ sender: UIButton) {
        
        
        
        delegate = UIApplication.shared.delegate as! AppDelegate
        clearbutton()
        count += 1
//       let a = List.count
//
//        if a == 5
//        {
//           score.text = String( totlscore)
//        }
        
//        while List[count] == 5 as Any {
//            score.text = String( totlscore)
//        }

        score.isHidden = false
        score.text = "Total score = \(String( totlscore.count))"
        score.textColor = UIColor.orange
        backbutton.isHidden = true
        view.layer.removeAllAnimations()
        let context:NSManagedObjectContext = delegate!.persistentContainer.viewContext
        let fetchRequest : NSFetchRequest<Language> = Language.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "langid = %@", langidf)
        
        do
        {
            List = try context.fetch(fetchRequest) 
            let result = List[count]as! Language
            
            let qustins = result.querel?.allObjects as! [Question]
            
            for res in qustins
            {
               // print("res=\(res.answer1)")
                print("question = \(qustins)")
                
                
                answ1 = res.answer1!
                answ2 = res.answer2!
                answ3 = res.answer3!
                answ4 = res.answer4!
                showans = res.showanswer!
                
                QUENUMBER.text = String( res.questionno)
                QUESTIONTEXT.text = res.quetext
                ANSWER1.text = answ1
                ANSWER2.text = answ2
                ANSWER3.text = answ3
                ANSWER4.text = answ4
                finalanswer.text =  showans
                
                
                print("answ1 = \(answ1)")
                print("answ2 = \(answ2)")
                print("answ3 = \(answ3)")
                print("answ4 = \(answ4)")
                print("showan = \(showans)")
                
            }
        }
            catch
        {
            print(error.localizedDescription)
        }
        
}
    
    
    
    func clearbutton()
    {
        button1.isUserInteractionEnabled = true
        button2.isUserInteractionEnabled = true
        button3.isUserInteractionEnabled = true
        button4.isUserInteractionEnabled = true
        
        button1.isSelected = false
        button2.isSelected = false
        button3.isSelected = false
        button4.isSelected = false
        
        button1.backgroundColor = UIColor.white
        button2.backgroundColor = UIColor.white
        button3.backgroundColor = UIColor.white
        button4.backgroundColor = UIColor.white
        
       // finalanswer.text = ""
        finalanswer.isHidden = true
        
        button1.layer.removeAllAnimations()
        button2.layer.removeAllAnimations()
        button3.layer.removeAllAnimations()
        button4.layer.removeAllAnimations()
        self.view.layoutIfNeeded()

        alertlabel.isHidden = true
        
    }
    
    func alertcontroller(Usermessage:String) -> Void
    {
        DispatchQueue.main.async
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
}

