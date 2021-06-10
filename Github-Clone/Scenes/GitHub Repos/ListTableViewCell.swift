//
//  ListTableViewCell.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell, NibLoadable, RepoCellView {
    @IBOutlet weak var creationDateLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var repoNameLabel: UILabel!
    @IBOutlet weak var UserImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func displayCellData(repoName: String, repoOwner: String, repoProfile: String, repoDate: String) {
        self.userNameLabel.text = repoOwner
        self.repoNameLabel.text = repoName
        self.creationDateLabel.text = repoDate
        self.setProfilePic(imgLink: repoProfile)
    }
    
    func setProfilePic(imgLink: String){
        ImagesManager.shared.getImage(from: imgLink) { (image) in
            self.UserImg.image = image
        }
    }

}
