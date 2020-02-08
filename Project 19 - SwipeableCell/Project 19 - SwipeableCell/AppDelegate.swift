//
//  AppDelegate.swift
//  Project 19 - SwipeableCell
//
//  Created by Ryan on 2020/2/8.
//  Copyright © 2020 Ryan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow.init()
        window?.backgroundColor = .white
        let navigationController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}

