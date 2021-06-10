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
    
    lazy var searchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50))

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1647058824, green: 0.6745098039, blue: 0.8862745098, alpha: 1)
        setupSearchBar()
        setupTableView()
    }
    
}
