//
//  AppDelegate.swift
//  Project 02 - Stop Watch
//
//  Created by 吴学谦 on 2019/12/15.
//  Copyright © 2019 Ryan.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init()
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

}

