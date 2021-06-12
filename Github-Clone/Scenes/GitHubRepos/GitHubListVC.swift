//
//  GitHubListVC.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit

class GitHubListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var presenter: ReposPresenter!
    lazy var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        setupSearchBar()
        setupTableView()
        presenter = ReposPresenter(view: self)
        presenter.getRepos()
    }
}

extension GitHubListVC: RepoView{
    func showIndicator() {
        showActivityIndicator()
    }
    
    func hideIndicator() {
        hideActivityIndicator()
    }
    
    func fetchingReposSuccess() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func showError(error: String) {
        self.showAlert(message: error)
    }
    
    func noReposFoundedView() {
        print("No Repos Founded")
    }
    
    func handlingSearchBarText(searchBarText: String) {
        searchBar.text = searchBarText
    }
    
    func emptytextAlert(msg: String) {
        self.showError(error: msg)
    }
    
    
}
