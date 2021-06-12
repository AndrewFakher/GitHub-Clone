//
//  ReposPresenter.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
import RealmSwift
class ReposPresenter{
    
    private weak var view: RepoView?
    private let repository = ReposListRepository()
    private let router = ReposRouter()

    private var repos = List<RepoModel>()

    init(view: RepoView){
        self.view = view
    }
    
    func getRepos(){
        view?.showIndicator()
        repository.getAllRepos { repos, error in
            self.view?.hideIndicator()
            if let repos = repos {
                self.repos = repos
                self.view?.fetchingReposSuccess()
            }
            if let error = error{
                self.view?.showError(error: error)
            }
        }
    }
    
    func getSearchedReposFromCach(repoName: String){
        repository.getSearchedReposFromCach(repoName: repoName) { (repos) in
            if let repos = repos {
                self.repos = repos
                self.view?.fetchingReposSuccess()
            }else{
                self.view?.showError(error: "No Repositories Founded!")
            }
        }
    }
    
    func loadMoreRecipes(query:String){
        view?.showIndicator()
    }
    
    func getReposCount() -> Int {
         return repos.count
     }
     
     func addSearchBarText(text: String){
         self.view?.handlingSearchBarText(searchBarText: text)
     }
     
     func enteringEmptyText(msg: String){
         self.view?.showAlert(message: msg)
     }

    func configure(cell: ListTableViewCell, for index: Int) {
        let repo = repos[index]
        let title = repo.name
        let repoOwner = repo.owner?.login
        let userProfile = repo.owner?.avatar_url
        let repoURL = repo.html_url
        
        cell.displayCellData(repoName: title , repoOwner: repoOwner ?? "", repoProfile: userProfile ?? "", repoURL: repoURL)
    }
    
    func navigateToRepoDetails(for index: Int){
        let repo = repos[index]
        router.goToRepoDetails(from: view, repo: repo)
    }
}