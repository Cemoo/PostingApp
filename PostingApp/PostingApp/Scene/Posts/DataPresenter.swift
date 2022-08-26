//
//  DataPresenter.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 25.08.2022.
//

import Foundation

struct DataPresenter {
    
    private var utilPosts: [PostModel] = DataUtils.posts.reversed()
    
    var users: [UserModel] {
        return DataUtils.users
    }
    
    var posts: [PostModel] {
        DataUtils.posts
    }
    
    func userPosts(for user: UserModel?) -> [PostModel] {
        utilPosts.filter { $0.user?.id == user?.id }
    }
    
    mutating func addPost(with post: PostModel) {
        utilPosts.insert(post, at: 0)
    }
}

