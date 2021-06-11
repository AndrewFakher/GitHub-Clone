//
//  RepositoriesModel.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
import RealmSwift

class RepoModel:Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var full_name: String = ""
    @objc dynamic var owner: OwnerModel?
    @objc dynamic var html_url: String = ""

    override class func primaryKey() -> String? {
        return "id"
    }
}

class OwnerModel:Object, Codable {
    @objc dynamic var login: String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var avatar_url: String = ""
}
