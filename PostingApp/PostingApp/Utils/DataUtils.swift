//
//  DataUtils.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 25.08.2022.
//

import Foundation
import UIKit

struct DataUtils {
    static var users: [UserModel] {
        [
            UserModel(id: "1",
                      name: "Elon Musk",
                      userName: "@heyelon",
                      userImage: "elon"),
            UserModel(id: "2",
                      name: "Bill Gates",
                      userName: "@heybill",
                      userImage: "bill"),
            UserModel(id: "3",
                      name: "Steve Jobs",
                      userName: "@heysteve",
                      userImage: "steve")
            
        ]
    }
    
    static var posts: [PostModel] {
        [
            PostModel(postId: "1",
                      description: "Innovation distinguishes between a leader and a follower.",
                      postImage: UIImage(named: "steve_post")!,
                      user: users[0]),
            PostModel(postId: "2",
                      description: "Don't compare yourself with anyone in this world… if you do so, you are insulting yourself.",
                      postImage: nil,
                      user: users[1]),
            PostModel(postId: "3",
                      description: "Some people don't like change, but you need to embrace change if the alternative is disaster. Some people don't like change, but you need to embrace change if the alternative is disaster.",
                      postImage: UIImage(named: "elon_post")!,
                      user: users[2])
        ]
    }
}
