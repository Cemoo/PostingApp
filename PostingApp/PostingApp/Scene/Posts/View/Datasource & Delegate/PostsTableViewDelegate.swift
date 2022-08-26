//
//  PostTableViewDatasource.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 26.08.2022.
//

import UIKit

class PostTableViewDatasource: NSObject, UITableViewDataSource {
    
    private var viewModel: PostsViewModelProtocol?
    
    func update(with viewModel: PostsViewModelProtocol) {
        self.viewModel = viewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.posts.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellIdentifier, for: indexPath) as? PostTableViewCell,
              let post = viewModel?.posts.get(indexPath.row) else {
            return UITableViewCell()
        }
        
        cell.configure(with: post)
        return cell
    }
}

