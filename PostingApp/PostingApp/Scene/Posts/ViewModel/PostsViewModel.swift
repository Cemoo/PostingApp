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
    
    func load(_ forUser: Bool)
}

final class PostsViewModel: PostsViewModelProtocol {
    weak var view: PostsViewProtocol?
    var selectedUser: UserModel?

    private var presenter: DataPresenter
    private var forUser: Bool = false
   
    init() {
        presenter = DataPresenter()
    }
    
    var users: [UserModel] {
        presenter.users
    }
    
    var posts: [PostModel] {
        forUser ? presenter.userPosts(for: selectedUser) : presenter.posts
    }
    
    func load(_ forUser: Bool = false) {
        self.forUser = forUser
        view?.reloadPosts()
    }
}
