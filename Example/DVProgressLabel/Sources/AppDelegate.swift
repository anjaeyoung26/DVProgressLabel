//
//  AppDelegate.swift
//  DVProgressLabel
//
//  Created by anjaeyoung26 on 03/18/2022.
//  Copyright (c) 2022 anjaeyoung26. All rights reserved.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = ViewController()
    window?.backgroundColor = .white
    window?.makeKeyAndVisible()
    
    return true
  }
}


