//
//  AppDelegate.swift
//  3D Touch
//
//  Created by MEHEDI.R8 on 11/8/18.
//  Copyright © 2018 R8soft. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var vcsArray = [UIViewController]()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let settingVC = storyboard.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        let mapVC = storyboard.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        let chatVC = storyboard.instantiateViewController(withIdentifier: "ChatVC") as! ChatVC
        vcsArray = [settingVC, mapVC, chatVC]
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
    
    enum shortcutType: String {
        case setting = "Setting"
        case map = "Map"
        case chat = "Chat"
    }
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let navVC = window?.rootViewController as! UINavigationController
        navVC.setViewControllers(vcsArray, animated: false)
        
        if let type = shortcutItem.type.components(separatedBy: ".").last {
            
            switch type {
            case shortcutType.map.rawValue:
                navVC.popToViewController(vcsArray[1], animated: true)
                completionHandler(true)
                
            case shortcutType.chat.rawValue:
                navVC.popToViewController(vcsArray[2], animated: true)
                completionHandler(true)
                
            default:
                navVC.popViewController(animated: true)
                completionHandler(true)
            }
        }
        completionHandler(false)
    }
}

