//
//  AppDelegate.swift
//  VoltLinesChallenge
//
//  Created by Ekin Demir on 1.05.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window?.rootViewController = MapViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

}

