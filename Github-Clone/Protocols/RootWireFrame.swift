//
//  RootWireFrame.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit
//MARK: Root Router Protocol

protocol RootWireframe: class {
    var rootViewController: UIViewController! {get set}
    func presentRootScreen(in window: UIWindow)
}
