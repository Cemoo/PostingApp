//
//  AddPostBuilder.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 26.08.2022.
//

import Foundation

enum AddPostBuilder {
    static func generate(with viewModel: AddPostViewModelProtocol) -> AddPostViewController {
        AddPostViewController(viewModel: viewModel)
    }
}
