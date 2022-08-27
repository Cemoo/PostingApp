//
//  DataPresenter.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 25.08.2022.
//

import Foundation

final class DataPresenter {
    
    private var utilPosts: [PostModel] = DataUtils.posts.reversed()
    
    static let shared: DataPresenter = DataPresenter()
    
    var users: [UserModel] {
        return DataUtils.users
    }
    
    var posts: [PostModel] {
        utilPosts
    }
    
    func userPosts(for user: UserModel?) -> [PostModel] {
        utilPosts.filter { $0.user?.id == user?.id }
    }
    
    func addPost(with post: PostModel) {
        utilPosts.insert(post, at: 0)
    }
}

