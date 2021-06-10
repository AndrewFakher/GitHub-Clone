//
//  ImageManager.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import UIKit

class ImagesManager {
    
    static let shared = ImagesManager()
    private var cache: NSCache<NSString, UIImage> = NSCache()
    
    func getImage(from imagePath: String, completionHandler: @escaping (UIImage?) -> ()) {
        if let image = cache.object(forKey: imagePath as NSString) {
            DispatchQueue.main.async {
                completionHandler(image)
            }
        } else {
            let placeholderImage = #imageLiteral(resourceName: "istockphoto-1016744034-612x612.jpg")
            DispatchQueue.main.async {
                completionHandler(placeholderImage)
            }
            guard let url = URL(string: imagePath) else {return}
            DispatchQueue.global(qos: .background).async { [weak self] in
                guard let self = self else { return }
                if let data = try? Data(contentsOf: url) {
                    let img: UIImage! = UIImage(data: data)
                    self.cache.setObject(img, forKey: imagePath as NSString)
                    DispatchQueue.main.async {
                        completionHandler(img)
                    }
                }
            }
        }
    }
}
