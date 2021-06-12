//
//  SearchWithoutRepoSpy.swift
//  Github-CloneTests
//
//  Created by Andrew on 6/12/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
import Github_Clone

@testable import Github_Clone

class SearchWithoutRepoSpy {
    private(set) var getReposHasBeenCalled: Bool = false
    
    func getRepos(finish: @escaping ([RepoModel]?) -> Void) {
        getReposHasBeenCalled = true
        finish(nil)
    }
}

