//
//  AppDelegate.swift
//  KGNPreferredFontManagerExample
//
//  Created by David Keegan on 10/14/15.
//  Copyright © 2015 David Keegan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // Cannot be lazy in the current version of swift
    var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window?.rootViewController = FontTestViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

}

