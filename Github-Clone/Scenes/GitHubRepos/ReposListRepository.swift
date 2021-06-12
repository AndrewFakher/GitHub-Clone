//
//  ReposListRepository.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
import RealmSwift

//MARK: Repos Network Services

class ReposListRepository: NetworkResponsable {
    let router = Router<GitHubApi>()
    private let realm: RealmService
    
    init(realm: RealmService = RealmService.shared) {
        self.realm = realm
    }

    //MARK: get all repos

    func getAllRepos(completion: @escaping (_ repos: List<RepoModel>?,_ error: String?)->()){
        router.request(.reposList) { data, response, error in
            if error != nil {
                completion(nil,"Please check your network connection.")
                self.getReposFromCach { repos in
                    completion(repos,nil)
                }
            }
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(List<RepoModel>.self, from: responseData)
                        DispatchQueue.main.async {
                            self.realm.setDataForRepos(repos: apiResponse)
                        }
                        completion(apiResponse,nil)
                    }catch {
                        print(error)
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure:
                    completion(nil, NetworkResponse.unKnown.rawValue)
                }
            }
        }
    }
    
    //MARK: get repos from cach

    func getReposFromCach(completion: @escaping (_ repos: List<RepoModel>?)->()){
        DispatchQueue.main.async {
            self.realm.getReposFromCach { repos in
                completion(repos)
            }
        }
    }
    
    //MARK: search repo from cach

    func getSearchedReposFromCach(repoName: String, completion: @escaping (_ repos: List<RepoModel>?)->()){
        DispatchQueue.main.async {
            self.realm.searchFromCach(repoName: repoName) { repos in
                completion(repos)
            }
        }
    }
    
    
}
