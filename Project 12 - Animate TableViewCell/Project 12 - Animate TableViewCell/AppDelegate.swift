//
//  AppDelegate.swift
//  Project 12 - Animate TableViewCell
//
//  Created by Ryan on 2020/1/1.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init()
        window?.backgroundColor = .black
        window?.rootViewController = ViewController();
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

    
}

