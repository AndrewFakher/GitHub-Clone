//
//  GitHubListVC+Search.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit
extension GitHubListVC: UISearchBarDelegate{
    
    func setupSearchBar(){
        searchBar.placeholder = "Search..."
        searchBar.tintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        let leftNavBarButton = UIBarButtonItem(customView:searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        searchBar.delegate = self
    }
    
    //MARK: SearchBar Delegate

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchedText = searchBar.text else {return}
        if !searchedText.trimmingCharacters(in: .whitespaces).isEmpty, searchedText.count >= 2 {
            print(searchedText)
            presenter.getSearchedReposFromCach(repoName: searchedText)
        }
    }
}
