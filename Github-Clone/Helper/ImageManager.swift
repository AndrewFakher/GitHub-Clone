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
            let placeholderImage = #imageLiteral(resourceName: "placeholder")
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

//fileprivate let imageCache =  NSCache<AnyObject, AnyObject>()
//
//extension UIImageView {
// 
// func downloadImage(url: NSURL? , contentMode mode: ContentMode = .scaleAspectFit) {
//     contentMode = mode
//     self.image = UIImage(named: "avatar")
//     guard let url = url else {
//         return
//     }
//     if let cachedImage = imageCache.object(forKey: url) as? UIImage {
//         self.image = cachedImage
//     } else {
//         URLSession.shared.dataTask(with: url as URL, completionHandler: { (data, response, error) in
//
//             guard let data = data, error == nil else {
//                 print(error?.localizedDescription ?? "Image loading error")
//                 return
//             }
//             
//             DispatchQueue.main.async{
//                 if let downloadedImage = UIImage(data: data) {
//                     imageCache.setObject(downloadedImage, forKey: url)
//                     self.image = downloadedImage
//                 }
//             }
//         }).resume()
//     }
// }
//}
//
