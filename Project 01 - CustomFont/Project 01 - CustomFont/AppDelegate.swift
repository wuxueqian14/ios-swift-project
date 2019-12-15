//
//  AppDelegate.swift
//  Project 01 - CustomFont
//
//  Created by 吴学谦 on 2019/12/10.
//  Copyright © 2019 Ryan.com. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init()
       // window?.frame = UIScreen.main.bounds
        window?.makeKeyAndVisible()
        let navigationController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navigationController
        // Override point for customization after application launch.
        return true
    }



}

