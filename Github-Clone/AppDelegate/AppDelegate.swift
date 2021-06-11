//
//  AppDelegate.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let rootRouter = RootRouter()

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        rootRouter.presentRootScreen(in: window!)
        return true
    }


}

