//
//  Alertable_Ext.swift
//  Github-Clone
//
//  Created by Andrew on 6/10/21.
//  Copyright © 2021 Andrew. All rights reserved.
//

import Foundation
import UIKit
//MARK: AlertView Extension

extension Alertable where Self: UIViewController {
    
    func showAlert(message:String?){
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "GitHub", message: message, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "OK", style: .default, handler:
            { (action: UIAlertAction!) in
                DispatchQueue.main.async {
                    self.dismiss(animated: true, completion: nil)
                }
            })
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

