//
//  UIViewController-Ext.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 27.08.2022.
//

import UIKit

extension UIViewController {
    func showMessage(withMessage message: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let alert = UIAlertController(title: "Posting App",
                                          message: message,
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
    }
}
