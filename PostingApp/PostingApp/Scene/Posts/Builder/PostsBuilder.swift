//
//  PostsBuilder.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 25.08.2022.
//

import Foundation

enum PostsBuilder {
    static func generate(with viewModel: PostsViewModelProtocol) -> PostsViewController {
        let view = PostsViewController(with: viewModel)
        viewModel.view = view
        return view
    }
}
