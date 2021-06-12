//
//  SearchRepositoryTest.swift
//  Github-CloneTests
//
//  Created by Andrew on 6/12/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
import XCTest
import RealmSwift

@testable import Github_Clone

class SearchRepositoryTest: XCTestCase {
    private var searchRepository: ReposListRepository!
    
    func testReposRetrieved() {
        givenReposRepository()
        whenTheRepositoryTryToRetrieveRecipes { [unowned self] repos, repositoryExpectation in
            self.thenTheReposListIsRetrieved(repos: repos,
                                                expectation: repositoryExpectation)
        }
        thenTheRepositoryFinishedToTryToRetrieve()
    }
    
    private func givenReposRepository() {
        searchRepository = ReposListRepository()
    }
    
    func whenTheRepositoryTryToRetrieveRecipes(finish: @escaping (List<RepoModel>?, XCTestExpectation) -> Void) {
        let repositoryExpectation = expectation(description: "RepositoryExpectation")
        searchRepository.getSearchedReposFromCach(repoName: "grit") { repos in
            finish(repos,repositoryExpectation)
        }
    }
    
    private func thenTheReposListIsRetrieved(repos: List<RepoModel>?, expectation: XCTestExpectation) {
        XCTAssertNotNil(repos)
        XCTAssertTrue(repos!.count > 0)
        expectation.fulfill()
    }
    
    private func thenTheRepositoryFinishedToTryToRetrieve() {
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("Repository finish() not called: \(error)")
            }
        }
    }
}
