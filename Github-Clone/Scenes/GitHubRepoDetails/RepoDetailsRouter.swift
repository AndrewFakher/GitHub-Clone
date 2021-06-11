//
//  RepoDetailsRouter.swift
//  Github-Clone
//
//  Created by Andrew on 6/11/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit

class RepoDetailsRouter{
    static func assembleRepoDetailshModule(repo: RepoModel) -> UIViewController {
        let repoDetailsVC = mainstoryboard.instantiateViewController(withIdentifier: "RepoDetailsView")
        if let repoDetailsView = repoDetailsVC as? RepoDetailsView {
            let presenter = RepoDetailsPresenter(repoDetailsView: repoDetailsView, repo: repo)
            repoDetailsView.presenter = presenter
        }
        return repoDetailsVC
    }

    private static var mainstoryboard: UIStoryboard{
        return UIStoryboard(name:"RepoDetailsView",bundle: Bundle.main)
    }

}
