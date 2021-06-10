//
//  Indicatable_Ext.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//
import UIKit

//MARK: Activity Indicator Extension

fileprivate var activityIndicator = UIActivityIndicatorView(style: .large)

extension Indicatable where Self: UIViewController {
    
    func showActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.color = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
        self.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            activityIndicator.stopAnimating()
        }
    }
}
