//
//  RepoDetailsView.swift
//  Github-Clone
//
//  Created by Andrew on 6/11/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
protocol RepoDetailsView: class {
    var presenter: RepoDetailsPresenter? { get set }
    func setUserImage(imageLink: String)
    func setRepoName(repoName:String)
    func setUserName(userName:String)
    func setRepoLink(repoLink: String)
}
