//
//  GitHubListVC+Search.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit

//MARK: Repos SearchBar Delegate

extension GitHubListVC: UISearchBarDelegate{
    
    func setupSearchBar(){
        searchBar.placeholder = "Search..."
        searchBar.tintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        searchBar.delegate = self
    }
    
    //MARK: SearchBar Delegate
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchedText = searchBar.text else {return}
        if !searchedText.trimmingCharacters(in: .whitespaces).isEmpty, searchedText.count >= 2 {
            presenter.getSearchedReposFromCach(repoName: searchedText)
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {presenter.getRepos()}
    }
    
}
