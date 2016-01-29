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

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.mainScreen().bounds)

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        self.window?.rootViewController = FontTestViewController()
        self.window?.makeKeyAndVisible()
        return true
    }

}

