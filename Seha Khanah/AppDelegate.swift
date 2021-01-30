//
//  AppDelegate.swift
//  Seha Khanah
//
//  Created by Anas on 12/14/20.
//  Copyright © 2020 Anas. All rights reserved.
//

import UIKit
import CoreData
import UIKit
import FBSDKCoreKit
import GoogleSignIn
import MOLH
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MOLHResetable   {


    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ApplicationDelegate.shared.application(
                       application,
                       didFinishLaunchingWithOptions: launchOptions
                   )
     
      UINavigationBar.appearance().barTintColor = UIColor.init(red: 0.0/255, green: 75.0/255, blue: 142.0/255, alpha: 1.0)
      UINavigationBar.appearance().tintColor = UIColor.white
      UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white,NSAttributedString.Key.font: UIFont(name: "AGOOGLE", size: 15)!]

        GIDSignIn.sharedInstance().clientID = "151320045397-sotvam4tirfvpncfah1n2gjrlv1ak4gi.apps.googleusercontent.com"
        MOLHLanguage.setDefaultLanguage("ar")
        MOLH.shared.activate(true)
        MOLH.shared.specialKeyWords = ["Cancel","Done"]
        reset()
        return true
    }
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {

        ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
           return GIDSignIn.sharedInstance().handle(url)

    }
    
    func reset() {
        let rootViewController: UIWindow = ((UIApplication.shared.delegate?.window)!)!
        let story = UIStoryboard(name: "Search", bundle: nil)
        rootViewController.rootViewController = story.instantiateViewController(withIdentifier: "TabBar")
    }

//    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
//
//    // MARK: - Core Data stack
//
//    lazy var persistentContainer: NSPersistentContainer = {
//        /*
//         The persistent container for the application. This implementation
//         creates and returns a container, having loaded the store for the
//         application to it. This property is optional since there are legitimate
//         error conditions that could cause the creation of the store to fail.
//        */
//        let container = NSPersistentContainer(name: "Seha_Khanah")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//
//                /*
//                 Typical reasons for an error here include:
//                 * The parent directory does not exist, cannot be created, or disallows writing.
//                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                 * The device is out of space.
//                 * The store could not be migrated to the current model version.
//                 Check the error message to determine what the actual problem was.
//                 */
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    // MARK: - Core Data Saving support
//
//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }

}

