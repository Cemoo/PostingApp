//
//  UserModel.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 25.08.2022.
//

import UIKit

struct UserModel: Codable {
    let id : String?
    let name: String?
    let userName: String?
    let userImage: String?
}

struct PostModel: Codable {
    let postId: String?
    let title: String?
    let description: String?
    let postImage: String?
    let user: UserModel?
}

