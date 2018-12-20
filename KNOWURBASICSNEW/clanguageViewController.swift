//
//  clanguageViewController.swift
//  KNOWURBASICSNEW
//
//  Created by Student016 on 29/11/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit
import  FirebaseDatabase
import Firebase
import CoreData
var List : [Any] = []


class clanguageViewController: UIViewController {
    
    var languageback:String?
    var ref:FIRDatabaseReference!
    var clangdict = NSMutableDictionary()
    
    //coredata
    var delegate:AppDelegate!
    
    
    @IBOutlet weak var quenumber: UITextField!
    
    @IBOutlet weak var TEXTVIEW: UITextView!
    

    @IBOutlet weak var answer1: UITextField!
    
    
    @IBOutlet weak var answer2: UITextField!
    
    @IBOutlet weak var answer3: UITextField!
    
    @IBOutlet weak var answer4: UITextField!
    
    @IBOutlet weak var finalanswr: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = UIApplication.shared.delegate as! AppDelegate
        

    }

    @IBAction func backbutton(_ sender: UIButton) {
       self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savebutton(_ sender: UIButton)
    {
        //firebase code
   ref = FIRDatabase.database().reference()
        clangdict.setValue(TEXTVIEW.text, forKey: "textv")
        clangdict.setValue(answer1.text, forKey: "answ1")
        clangdict.setValue(answer2.text, forKey: "answ2")
        clangdict.setValue(answer3.text, forKey: "answ3")
        clangdict.setValue(answer4.text, forKey: "answ4")
        clangdict.setValue(finalanswr.text, forKey: "finalans")
        ref.child(languageback!).childByAutoId().setValue(clangdict) { (error, reference) in
            if (error != nil)
            {
                print("failed to insert:\(error?.localizedDescription)")
            }
            else
            {
                print("insert:success")
            }
        }
        //coredata code
        let context:NSManagedObjectContext = delegate.persistentContainer.viewContext
       
        
        let que:Question = NSEntityDescription.insertNewObject(forEntityName: "Question", into: context) as! Question
        
        let numberFormatter = NumberFormatter();
        let queno = numberFormatter.number(from: quenumber.text!);
        
        
        
        que.questionno = queno as! Int16
        que.quetext = TEXTVIEW.text
        que.answer1 = answer1.text
        que.answer2 = answer2.text
        que.answer3 = answer3.text
        que.answer4 = answer4.text
        que.showanswer = finalanswr.text
        
//que.langrel?.langid = languageback
        let lang:Language = NSEntityDescription.insertNewObject(forEntityName: "Language", into: context) as! Language
        lang.langid = languageback
        
//relation
        
         lang.addToQuerel(que)
        
        
        do
        {
            try context.save()
            print("Insert Success:")
        }
        catch
        {
            print(error.localizedDescription)
        }
    
        
        //fetch
        let fetchrequest:NSFetchRequest<Question> = Question.fetchRequest()
       // fetchrequest.predicate = NSPredicate(format: "langid = %@", "SWIFT")
        
        do{
            List = try context.fetch(fetchrequest)
            for result in List as! [Question]
            {
                if let qText = result.quetext
                {
                    print(qText)
                }
            
                print("que no:\(result.questionno)")
                print("quetext :\(result.quetext)")
                print("answer1:\(result.answer1)")
                print("answer2:\(result.answer2)")
                print("answer3:\(result.answer3)")
                print("answer4:\(result.answer4)")
                print("showanswr:\(result.showanswer)")
                print("lanid:\(result.langrel)")
            }
            do
            {
                try context.save()
                print("Insert Success:")
            }
            catch
            {
                print(error.localizedDescription)
            }
        }
        catch
        {
            print(error.localizedDescription)
        }
        
        
        
    }
        
    
    @IBAction func nextbutton(_ sender: UIButton) {
        performSegue(withIdentifier: "next", sender: self)
    }
   
    @IBAction func updatebutton(_ sender: UIButton) {
        let context = delegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Question");
        request.predicate = NSPredicate(format: "questionno =%@", quenumber.text!)
      //  fetchrequest.returnsObjectsAsFaults = false
        do
        {
            List = try context.fetch(request)
        if List.count == 1
        {
            let data:NSManagedObject = List.first as! NSManagedObject
         
            data.setValue(TEXTVIEW.text, forKey: "quetext")
            data.setValue(answer1.text, forKey: "answer1")
            data.setValue(answer2.text, forKey: "answer2")
            data.setValue(answer3.text, forKey: "answer3")
            data.setValue(answer4.text, forKey: "answer4")
            data.setValue(finalanswr.text, forKey: "showanswer")
     
            do
            {
                try context.save()
            }
            catch
            {
                print("ERROR :: \(error.localizedDescription)")
            }
            }
        }
            catch
            {
                print("error in updating ::\(error.localizedDescription)")
            }
  
    }
        }
    





    
    
    


