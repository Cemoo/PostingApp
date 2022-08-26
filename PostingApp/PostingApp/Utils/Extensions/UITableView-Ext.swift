//
//  UITableView-Ext.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 26.08.2022.
//

import UIKit

extension UITableView {
    func registerNib(nibName name: String, cellIdentifier identifier: String) {
        self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
