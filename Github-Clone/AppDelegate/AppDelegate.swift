//
//  AppDelegate.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let rootRouter = RootRouter()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        rootRouter.presentRootScreen(in: window!)
        AppDelegate.realmMigration()
        return true
    }
}

//MARK: Realm Migration

extension AppDelegate{
    public static func realmMigration() {
        let currentSchemaVersion: UInt64 = 1
        let config = Realm.Configuration(schemaVersion: currentSchemaVersion, migrationBlock: { migration, oldSchemaVersion in
            if oldSchemaVersion < currentSchemaVersion {
                migration.deleteData(forType: "RepodModel")
            }
        })
        Realm.Configuration.defaultConfiguration = config
        do {
            _  = try Realm()
        } catch {
            print("Failed to open realm: \(error.localizedDescription)")
        }
    }
}
