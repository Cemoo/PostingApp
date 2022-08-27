//
//  PostsViewModel.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 25.08.2022.
//

import Foundation

protocol PostsViewModelProtocol: AnyObject {
    var view: PostsViewProtocol? { get set }
    var users: [UserModel] { get }
    var posts: [PostModel] { get }
    var selectedUser: UserModel? { get set }
    
    func navigateAddPost()
    func load(_ forUser: Bool)
}

final class PostsViewModel: PostsViewModelProtocol {
    
    // MARK: - Public  Properties
    weak var view: PostsViewProtocol?
    var selectedUser: UserModel?

    // MARK: - Private Properties
    private let coordinator: Coordinator
    private var forUser: Bool = false
   
    // MARK: - Init
    init(with coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    var users: [UserModel] {
        DataPresenter.shared.users
    }
    
    var posts: [PostModel] {
        forUser ? DataPresenter.shared.userPosts(for: selectedUser) : DataPresenter.shared.posts
    }
    
    func load(_ forUser: Bool = false) {
        self.forUser = forUser
        view?.reloadPosts()
    }
    
    func navigateAddPost() {
        guard let user = selectedUser else {
            self.view?.showError(withMessage: "Please select a user")
            return
        }
        
        let coordinator = AddPostCoordinator(with: coordinator.navigationController, user: user)
        coordinator.start()
    }
}

