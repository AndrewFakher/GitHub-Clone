//
//  ReposPresenterTest.swift
//  Github-CloneTests
//
//  Created by Andrew on 6/12/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
import XCTest
@testable import Github_Clone

class ReposPresenterTest: XCTestCase{
    private var searchRepositoryWithRepos: SearchRepositorySpy!
    private var searchRepositoryWithoutRepos: SearchWithoutRepoSpy!
    private var repoView: SearchViewSpy!
    private var repoPresenter: ReposPresenter!
    
    func testOnStartWithRepos() {
        givenSearchRepositoryWithRepos()
        givenASearchView()
        givenASearchPresenterWith()
    }
    
    private func givenSearchRepositoryWithRepos() {
        searchRepositoryWithRepos = SearchRepositorySpy()
    }
    
    private func givenASearchView() {
        repoView = SearchViewSpy()
    }
    
    private func givenASearchPresenterWith() {
        repoPresenter = ReposPresenter(view: repoView)
    }
    
    private func thenTryToEmptyingTextAlert() {
        XCTAssertFalse(repoView.emptytextAlertHasBeenCalled)
    }
    
    private func thenTheSearchViewShowsLoadingStatus() {
        XCTAssertFalse(repoView.showActivityIndicatorHasBeenCalled)
    }

    private func thenTheSearchViewHidesLoadingStatus() {
        XCTAssertFalse(repoView.hideActivityIndicatorHasBeenCalled)
    }

    private func thenNoReposViewFounded() {
        XCTAssertTrue(repoView.noReposFoundedViewHasBeenCalled)
    }
    
    
    private func thenReloadingTableView() {
        XCTAssertTrue(repoView.fetchingReposSuccessHasBeenCalled)
    }
}
