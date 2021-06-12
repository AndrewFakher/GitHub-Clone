//
//  RepoDetailsVC.swift
//  Github-Clone
//
//  Created by Andrew on 6/11/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit
import SafariServices

class RepoDetailsVC: UIViewController {

    @IBOutlet weak var repoLinkBtn: UIButton!{
        didSet{
            repoLinkBtn.layer.cornerRadius = 20.0
        }
    }
    @IBOutlet weak var repoUserNameLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var userProfile: UIImageView!{
        didSet{
            userProfile.layer.cornerRadius = 30
        }
    }
    
    var presenter: RepoDetailsPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setRepoName()
        presenter?.setUserName()
        presenter?.setUserImage()
    }
    
    @IBAction func repoLinkBtnTapped(_ sender: Any) {
        presenter?.setRepoLink()
    }
    
}
extension RepoDetailsVC: RepoDetailsView{
    func setUserImage(imageLink: String) {
        if let imgURL = URL(string: imageLink){
            userProfile.load(url: imgURL)
        }
    }
    
    func setRepoName(repoName: String) {
        self.repoNameLabel.text = repoName
    }
    
    func setUserName(userName: String) {
        self.repoUserNameLabel.text = userName
    }
    
    func setRepoLink(repoLink: String) {
        if let url = URL(string: repoLink) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
}
