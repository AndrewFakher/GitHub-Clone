//
//  RepoView.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
import UIKit

protocol RepoView: Alertable, Indicatable {
    func showIndicator()
    func hideIndicator()
    func fetchingReposSuccess()
    func showError(error: String)
    func noReposFoundedView()
    func handlingSearchBarText(searchBarText: String)
    func emptytextAlert(msg: String)
}

protocol RepoCellView {
    func displayCellData(repoName: String, repoOwner: String, repoProfile: String, repoDate: String)
}

protocol RepoRouterProtocol: class {
    static func assembleRepohModule() -> UIViewController
}
