//
//  AppDelegate.swift
//  imsg
//
//  Created by Kuan on 12/2/16.
//  Copyright © 2016 Kuan. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //UNUserNotificationCenter.current()
        let center = UNUserNotificationCenter.current()
        center.delegate = self;
        center.requestAuthorization(options:[.alert, .sound]) { (granted, error) in
            // Enable or disable features based on authorization.
            if error == nil{
                UIApplication.shared.registerForRemoteNotifications()
                print("AppDelegate registerForRemoteNotifications")
                
                let generalCategory = UNNotificationCategory(identifier: "GENERAL",
                                                             actions: [],
                                                             intentIdentifiers: [],
                                                             options: .customDismissAction)
                
                // Create the custom actions for the TIMER_EXPIRED category.
                let reactAction = UNNotificationAction(identifier: "REACT_ACTION",
                                                        title: "React",
                                                        options: UNNotificationActionOptions(rawValue: 0))
                let stopAction = UNNotificationAction(identifier: "STOP_ACTION",
                                                      title: "Stop",
                                                      options: .foreground)
                
                let expiredCategory = UNNotificationCategory(identifier: "TIMER_EXPIRED",
                                                             actions: [reactAction, stopAction],
                                                             intentIdentifiers: [],
                                                             options: UNNotificationCategoryOptions(rawValue: 0))
                
                // Register the notification categories.
                center.setNotificationCategories([generalCategory, expiredCategory])
            }
        }
        // Override point for customization after application launch.

        print("AppDelegate didFinishLaunchingWithOptions")
        
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

    
    // Handle remote notification registration.
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data){

        let deviceTokenString = deviceToken.reduce("", {$0 + String(format: "%02X", $1)})
        print(deviceTokenString)
    }
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        // The token is not currently available.
        print("Remote notification support is unavailable due to error: \(error.localizedDescription)")
        //self.disableRemoteNotificationFeatures()
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification notification: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print(notification)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                         didReceive response: UNNotificationResponse,
                                         withCompletionHandler completionHandler: @escaping () -> Void){
        print(response.actionIdentifier)
        if response.actionIdentifier == "REACT_ACTION" {
        }else{
            
        }
    
        print("userNotificationCenter didReceive")
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                         willPresent notification: UNNotification,
                                         withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void){

        print("userNotificationCenter willPresent")
    }

}

