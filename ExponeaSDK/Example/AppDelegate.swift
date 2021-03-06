//
//  AppDelegate.swift
//  Example
//
//  Created by Dominik Hadl on 01/05/2018.
//  Copyright © 2018 Exponea. All rights reserved.
//

import UIKit
import ExponeaSDK
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    static let memoryLogger = MemoryLogger()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Exponea.logger = AppDelegate.memoryLogger
        Exponea.logger.logLevel = .verbose
        
        UITabBar.appearance().tintColor = UIColor(red: 28/255, green: 23/255, blue: 50/255, alpha: 1.0)
        
        application.applicationIconBadgeNumber = 0
        
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let message = response.notification.request.content.body
        let alert = UIAlertController(title: "Push Notification Received", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
