//
//  Reusable.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit
//MARK: Reusing cells protocols

protocol Reusable: class {}

extension Reusable where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension Reusable where Self: UIViewController {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
