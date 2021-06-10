//
//  ReposPresenter.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation

class ReposVCPresenter{
    
    private weak var view: RepoView?
    private let repository = ReposListRepository()
    private let router = ReposRouter()

    private var repos = [RepoModel]()
    
    private var from = 1
    private var to = 1
    private var more = Bool()
    private var query = String()
    private var searchedQuery = String()

    init(view: RepoView){
        self.view = view
    }
    
    func getSearchedRepos(query:String){
        
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
        let repodDesc = repo.description
        
        cell.displayCellData(repoName: title ?? "", repoOwner: repoOwner ?? "", repoProfile: userProfile ?? "", repoDate: repodDesc ?? "")
    }
}
