//
//  AddPostCoordinator.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 26.08.2022.
//

import Foundation
import UIKit

final class AddPostCoordinator: Coordinator {
    
    var navigationController: UINavigationController?
    
    private let user: UserModel
    
    init(with navigationController: UINavigationController?, user: UserModel) {
        self.navigationController = navigationController
        self.user = user
    }
    
    func start() {
        let viewModel = AddPostViewModel(with: user)
        let addPostVC = AddPostBuilder.generate(with: viewModel)
        viewModel.view = addPostVC
        self.navigationController?.pushViewController(addPostVC, animated: true)
    }
}
