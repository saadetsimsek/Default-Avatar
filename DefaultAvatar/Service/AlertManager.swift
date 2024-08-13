//
//  AlertManager.swift
//  DefaultAvatar
//
//  Created by Saadet Şimşek on 13/08/2024.
//

import Foundation
import UIKit

class AlertManager {
    static func showTextFieldsAlert(vc: UIViewController, title: String, completionHandler: @escaping (String)-> Void){
        let alertController = UIAlertController(title: title,
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField { textField in
            textField.placeholder = "First name"
        }
        alertController.addTextField { textField in
            textField.placeholder = "Second name"
        }
        let okButton = UIAlertAction(title: "OK", style: .default) { _ in
            guard let textFields = alertController.textFields else {
                return
            }
            let username = textFields.compactMap{ $0.text }.joined(separator: " ")
            completionHandler(username)
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        
        DispatchQueue.main.async {
            vc.present(alertController, animated: true)
        }
        
    }
}
