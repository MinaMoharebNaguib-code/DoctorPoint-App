//
//  AppDelegate.swift
//  DoctorPoint
//
//  Created by Mina Mohareb on 01/04/2022.
//

import UIKit
import IQKeyboardManager
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared().isEnabled = true
        let isFirstIn = UserDefaults.standard.bool(forKey: "FirstTime")
        if isFirstIn{
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.window?.rootViewController = vc
        }
        return true
    }
}
