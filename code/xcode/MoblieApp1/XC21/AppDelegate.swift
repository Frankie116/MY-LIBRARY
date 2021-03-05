//
//  AppDelegate.swift
//  BT  x.x - Config 2
//

import UIKit
import AWSMobileClient
import AWSCore
import AWSPinpoint

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var pinpoint: AWSPinpoint?
    func application(_ application: UIApplication, open url: URL,
                     sourceApplication: String?, annotation: Any) -> Bool {
        return AWSMobileClient.sharedInstance().interceptApplication(
            application, open: url,
            sourceApplication: sourceApplication,
            annotation: annotation)
    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Initialize Pinpoint
        pinpoint = AWSPinpoint(configuration:
            AWSPinpointConfiguration.defaultPinpointConfiguration(launchOptions: launchOptions))
        return AWSMobileClient.sharedInstance().interceptApplication(
            application, didFinishLaunchingWithOptions:
            launchOptions)
    }
    func applicationWillResignActive(_ application: UIApplication) {}
    func applicationDidEnterBackground(_ application: UIApplication) {}
    func applicationWillEnterForeground(_ application: UIApplication) {}
    func applicationDidBecomeActive(_ application: UIApplication) {}
    func applicationWillTerminate(_ application: UIApplication) {}
}
