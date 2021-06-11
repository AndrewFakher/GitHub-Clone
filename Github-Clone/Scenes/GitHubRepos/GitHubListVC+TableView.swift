//
//  GitHubListVC+TableView.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit

extension GitHubListVC: UITableViewDataSource, UITableViewDelegate{
    func setupTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.keyboardDismissMode = .onDrag
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(ListTableViewCell.self)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getReposCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ListTableViewCell
        presenter.configure(cell: cell, for: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.navigateToRepoDetails(for: indexPath.row)
    }
    
}
