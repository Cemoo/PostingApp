//
//  Array-Ext.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 26.08.2022.
//

import Foundation

extension Array {
    func get(_ index: Index) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
}
