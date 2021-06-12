//
//  SearchRepositorySpy.swift
//  Github-CloneTests
//
//  Created by Andrew on 6/12/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
import Github_Clone

@testable import Github_Clone

class SearchRepositorySpy {
    private(set) var getReposHasBeenCalled: Bool = false
    
    func getRepos(finish: @escaping ([RepoModelTest]?) -> Void) {
        getReposHasBeenCalled = true
        let recpos = [RepoModelTest(id: 1, name: "grit", full_name: "mojombo/grit", html_url: "https://github.com/mojombo")]
        finish(recpos)
    }
}


struct RepoModelTest: Codable {
    var id: Int?
    var name: String?
    var full_name: String?
    var html_url: String?
}
