//
//  AppDelegate.swift
//  Colors
//
//  Created by Spencer Curtis on 4/9/19.
//  Copyright © 2019 Spencer Curtis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureSplitViewController()
    
        return true
    }
    
    func configureSplitViewController() {
        let splitViewController = window?.rootViewController as! UISplitViewController
        splitViewController.delegate = splitViewControllerDelegate
    }
    
    var splitViewControllerDelegate = SplitViewControllerDelegate()
}

