//
//  ViewProtocols.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
import Foundation
//MARK: View Protocols

protocol Indicatable: class {
    func showActivityIndicator()
    func hideActivityIndicator()
}

protocol Alertable: class {
    func showAlert(message: String?)
}

