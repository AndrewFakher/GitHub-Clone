//
//  ReposRouter.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit

//MARK: Repos List Router

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
    
    func goToRepoDetails(from view: RepoView?, repo: RepoModel) {
        let repoDetailsView = RepoDetailsRouter.assembleRepoDetailshModule(repo: repo)
        if let viewController = view as? UIViewController {
            viewController.present(repoDetailsView, animated: true, completion: nil)
        }
    }
}
