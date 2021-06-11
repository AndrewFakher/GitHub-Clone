//
//  RealmService.swift
//  Github-Clone
//
//  Created by Andrew on 6/11/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
import RealmSwift

class RealmService {

    static var shared = RealmService()
    private var realm: Realm?

    init() {
        do { realm = try Realm() } catch { }
    }
    
    func setDataForRepos(repos:List<RepoModel>)
    {
        let realm = try! Realm()
        for repo in repos{
            do {
                realm.beginWrite()
                realm.add(repo, update: .all)
                try realm.commitWrite()
            } catch (let error) {
                print(error)
            }
        }
    }
    
    func clearDataFromCach(repos:List<RepoModel>)
    {
        let realm = try! Realm()
        for repo in repos{
            try! realm.write {
                realm.delete(repo)
            }
        }
    }
    
    func getReposFromCach( completion :@escaping (_ repos:List<RepoModel>) -> ()) {
        let realm = try! Realm()
        let repos = realm.objects(RepoModel.self).sorted(byKeyPath: "id", ascending: true)
        let cachedRepos = List<RepoModel>()
        for repo in repos{
            cachedRepos.append(repo)
        }
        completion(cachedRepos)
    }
    
    func searchFromCach(repoName: String, completion :@escaping (_ repos:List<RepoModel>) -> ()) {
        let realm = try! Realm()
        let searchedRepos = realm.objects(RepoModel.self).filter("name contains[c] %@", repoName)
        
        let cachedRepos = List<RepoModel>()
        for repo in searchedRepos{
            cachedRepos.append(repo)
        }
        completion(cachedRepos)
    }
}
