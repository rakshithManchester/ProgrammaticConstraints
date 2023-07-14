//
//  AppDelegate.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 24/05/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        var router = SuggestionRouter()
        let navigation = router.configure(navigation: UINavigationController())
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        return true
    }


}

