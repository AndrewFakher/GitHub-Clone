//
//  UITableView_Ext.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//
import UIKit

//MARK: Reusing tableview cell extension

extension UITableViewCell: Reusable {}

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: NibLoadable {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T  {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError(":: Unable to dequeue cell with identifier : \(T.reuseIdentifier)")
        }
        return cell
    }
}
