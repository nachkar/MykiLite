//
//  AppDelegate.swift
//  MykiLite
//
//  Created by Awwad on 8/16/19.
//  Copyright © 2019 myki. All rights reserved.
//

import UIKit

let database = Database()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.

    // Initialize the window
    window = UIWindow(frame: UIScreen.main.bounds)

    // Set Background Color of window
    window?.backgroundColor = .darkGray

    // Allocate memory for an instance of the 'PasswordsViewController' class
    let passwordVC = PasswordsViewController()
    let navController = UINavigationController(rootViewController: passwordVC)
    navController.navigationBar.barTintColor = .navBar
    navController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    navController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    navController.navigationBar.tintColor = .mykiGreen
    navController.navigationBar.prefersLargeTitles = true

    // Set the root view controller of the app's window
    window!.rootViewController = navController

    // Make the window visible
    window!.makeKeyAndVisible()

    return true
  }

  func applicationWillResignActive(_ application: UIApplication) {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
  }

  func applicationDidEnterBackground(_ application: UIApplication) {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
  }

  func applicationWillEnterForeground(_ application: UIApplication) {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(_ application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(_ application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

