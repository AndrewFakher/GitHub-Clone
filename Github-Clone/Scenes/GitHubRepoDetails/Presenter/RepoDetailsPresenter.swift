//
//  RepoDetailsPresenter.swift
//  Github-Clone
//
//  Created by Andrew on 6/11/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
class RepoDetailsPresenter {
    
    //MARK: Properties
    private weak var view: RepoDetailsView?
    private var repoDetails = RepoModel()
    
    // initializing controller data
    init(repoDetailsView: RepoDetailsView?, repo: RepoModel) {
        self.view = repoDetailsView
        self.repoDetails = repo
    }
    

    //MARK: Set Repo Details Data

    func setUserImage(){
        guard let userImage = repoDetails.owner?.avatar_url else {return}
        self.view?.setUserImage(imageLink: userImage)
    }
    
    func setRepoName(){
        let repoName = repoDetails.name
        self.view?.setRepoName(repoName: repoName)
    }
    
    func setUserName(){
        guard let userName = repoDetails.owner?.login else {return}
        self.view?.setUserName(userName: userName)
    }
    
    func setRepoLink(){
         let repoLink = repoDetails.html_url
        self.view?.setRepoLink(repoLink: repoLink)
    }
}
