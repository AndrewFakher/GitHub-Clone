//
//  SearchViewSpy.swift
//  Github-CloneTests
//
//  Created by Andrew on 6/12/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
@testable import Github_Clone

class SearchViewSpy: RepoView{
    private(set) var showIndicatorHasBeenCalled: Bool = false
    private(set) var hideIndicatorHasBeenCalled: Bool = false
    private(set) var fetchingReposSuccessHasBeenCalled: Bool = false
    private(set) var showErrorHasBeenCalled: Bool = false
    private(set) var noReposFoundedViewHasBeenCalled: Bool = false
    private(set) var handlingSearchBarTextHasBeenCalled: Bool = false
    private(set) var showAlertHasBeenCalled: Bool = false
    private(set) var emptytextAlertHasBeenCalled: Bool = false
    private(set) var showActivityIndicatorHasBeenCalled: Bool = false
    private(set) var hideActivityIndicatorHasBeenCalled: Bool = false
    
    
    func showIndicator() {
        showActivityIndicatorHasBeenCalled = true
    }
    
    func hideIndicator() {
        hideActivityIndicatorHasBeenCalled = true
    }
    
    func fetchingReposSuccess() {
        fetchingReposSuccessHasBeenCalled = true
    }
    
    func showError(error: String) {
        showErrorHasBeenCalled = true
    }
    
    func noReposFoundedView() {
        noReposFoundedViewHasBeenCalled = true
    }
    
    func handlingSearchBarText(searchBarText: String) {
        handlingSearchBarTextHasBeenCalled = true
    }
    
    func emptytextAlert(msg: String) {
        emptytextAlertHasBeenCalled = true
    }
    
    func showAlert(message: String?) {
        showAlertHasBeenCalled = true
    }
    
    func showActivityIndicator() {
        showActivityIndicatorHasBeenCalled = true
    }
    
    func hideActivityIndicator() {
        hideActivityIndicatorHasBeenCalled = true
    }
}
