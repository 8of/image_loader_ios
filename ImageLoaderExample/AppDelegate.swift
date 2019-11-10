//
//  AppDelegate.swift
//  ImageLoaderExample
//
//  Created by Andrei Konstantinov on 30/08/2019.
//  Copyright © 2019 Test. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let router = SingleImageRouter()
    router.setupRootViewController(on: window?.rootViewController)
    window?.makeKeyAndVisible()
    return true
  }

}

