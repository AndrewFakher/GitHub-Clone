//
//  ReposRouter.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit

class ReposRouter: RepoRouterProtocol{
    weak var viewController: UIViewController!

    static func assembleRepohModule() -> UIViewController {
        let controller = mainstoryboard.instantiateViewController(withIdentifier: "GitHubListView")
        let navigation = UINavigationController(rootViewController: controller)
        return navigation
    }
    
    private static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"GitHubListView",bundle: Bundle.main)
    }
    
}
