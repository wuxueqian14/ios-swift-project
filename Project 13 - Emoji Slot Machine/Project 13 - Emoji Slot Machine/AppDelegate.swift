//
//  AppDelegate.swift
//  Project 13 - Emoji Slot Machine
//
//  Created by Ryan on 2020/1/8.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init()
        window?.rootViewController = ViewController()
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

}

