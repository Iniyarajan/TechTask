//
//  AppDelegate.swift
//  TechTask
//
//  Created by MAC on 03/07/19.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //root nav controller
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = RootController()
        
        let nav = UINavigationController(rootViewController: vc)
        
        self.window?.rootViewController = nav
        self.window?.makeKeyAndVisible()
        
        return true
    }

}

