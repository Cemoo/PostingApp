//
//  PostsCoordinator.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 25.08.2022.
//

import Foundation
import UIKit

final class PostsCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    // MARK: - Init
    init(with navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let postsVC = PostsBuilder.generate(with: PostsViewModel(with: self))
        navigationController?.pushViewController(postsVC, animated: true)
    }

}
