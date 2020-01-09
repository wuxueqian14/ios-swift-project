//
//  AppDelegate.swift
//  Project 14 - Animated Splash
//
//  Created by Ryan on 2020/1/9.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init()
        window?.rootViewController = ViewController()
        window?.backgroundColor = UIColor(red:0.117, green:0.631, blue:0.949, alpha:1)
        window?.makeKeyAndVisible()
        return true
    }


}

