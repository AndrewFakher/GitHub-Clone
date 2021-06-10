//
//  RepositoriesModel.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation

struct RepoModel: Codable {
    var id: Int?
    var name: String?
    var full_name: String?
    var owner: OwnerModel?
    var description: String?
}

struct OwnerModel: Codable {
    var login: String?
    var id: Int?
    var avatar_url: String?
}
