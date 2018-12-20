//
//  AppDelegate.swift
//  KNOWURBASICSNEW
//
//  Created by Student016 on 19/11/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import  FBSDKCoreKit
import GoogleSignIn
import SwiftKeychainWrapper



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate {
  //FIREBASE REGISTER ID
    //620147746916-92erd8amskgd94l6vqrbcd89rm55eoup.apps.googleusercontent.com
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
           let Email = email
            print(Email!)
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next1 = mainstoryboard.instantiateViewController(withIdentifier: "next1") as! languageview
            self.window?.rootViewController = next1
            
        }
    }
    

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
      
        //necessary for start firebase
        FIRApp.configure()
//
        let userid:String? = KeychainWrapper.standard.string(forKey: "EMAILKEY1")

        if userid != nil
        {
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homepage = mainstoryboard.instantiateViewController(withIdentifier: "userViewController") as! userViewController
            self.window?.rootViewController = homepage
        }
//        //fblaunchiung
        FBSDKApplicationDelegate.sharedInstance()?.application(application, didFinishLaunchingWithOptions: launchOptions)

        //620147746916-i0ohio6i2efbu9gtbabtgapv64muka42.apps.googleusercontent.com
   //    GIDSignIn.sharedInstance().clientID = "620147746916-ijeve00fjqboaj8gpdt9745ct4f8oea8.apps.googleusercontent.com"
    
    //    GIDSignIn.sharedInstance().clientID = "620147746916-i0ohio6i2efbu9gtbabtgapv64muka42.apps.googleusercontent.com"
       
        //for google sign in
        GIDSignIn.sharedInstance().clientID = FIRApp.defaultApp()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
// Override point for customization after application launch.
        return true
    }
   func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool
    {
        let handled: Bool = (FBSDKApplicationDelegate.sharedInstance()?.application(app, open: url, sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication]as! String, annotation: options [UIApplicationOpenURLOptionsKey.annotation]))!
        
         GIDSignIn.sharedInstance().handle(url as URL?,
                                                 sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                 annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        
        return handled
    }
    
    
    
    //for googleapllication sourcea apllication and annotation
//    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool
//    {
//        return GIDSignIn.sharedInstance().handle(url as URL?,
//                                                 sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
//                                                 annotation: options[UIApplicationOpenURLOptionsKey.annotation])
//    }
//    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "KNOWURBASICSNEW")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

