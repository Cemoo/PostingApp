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
}

final class PostsViewModel: PostsViewModelProtocol {
    
    weak var view: PostsViewProtocol?
    
    private var presenter: DataPresenter
   
    init() {
        presenter = DataPresenter()
    }
    
    var users: [UserModel] {
        presenter.users
    }
    
    
    var posts: [PostModel] {
        get {
            presenter.posts
        }
    }
    
    
}
