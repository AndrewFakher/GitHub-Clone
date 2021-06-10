//
//  ReposListRepository.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
class ReposListRepository: NetworkResponsable {
    let router = Router<GitHubApi>()
    
    func getAllRepos(completion: @escaping (_ repos: [RepoModel]?,_ error: String?)->()){
        router.request(.reposList) { data, response, error in
            if error != nil {
                completion([],"Please check your network connection.")
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion([], NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode([RepoModel].self, from: responseData)
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion([], NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure:
                    completion([], NetworkResponse.unKnown.rawValue)
                }
            }
        }
    }
    
}
