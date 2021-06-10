//
//  GitHubEndPoint.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation

public enum GitHubApi {
    case reposList

}

extension GitHubApi: EndPointType {
    
    var BaseURL : String {
         return "https://api.github.com"
    }
    
    var baseURL: URL {
        guard let url = URL(string: BaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .reposList:
            return "/repositories"
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .reposList:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        case .reposList:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
