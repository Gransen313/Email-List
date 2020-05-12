//
//  AppDelegate.swift
//  Email-List
//
//  Created by Sergey Borisov on 15.04.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //Declare one more variable here for adopting app to run on iOS 10-12 devices.
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
        
        //Call function here to adopt app to run on iOS 10-12 devices.
        setRootViewController()
        
        return true
    }
    
    //One more function for setting correct navigation stack for rootViewController here for adopting app to run on iOS 10-12 devices.
    private func setRootViewController() {
        
        let storyboard =  UIStoryboard(name: Const.mainStoryboardName, bundle: nil)
        
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let listVC = storyboard.instantiateViewController(withIdentifier: Const.VCID.list)
        let registerVC = storyboard.instantiateViewController(withIdentifier: Const.VCID.register)
        
        if Auth.auth().currentUser != nil {
            navigationController.viewControllers = [registerVC, listVC]
        } else {
            navigationController.viewControllers = [registerVC]
        }
        
        window?.rootViewController = navigationController
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

