//
//  AddPostViewModel.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 26.08.2022.
//

import UIKit

protocol AddPostViewModelProtocol: AnyObject {
    func addPost(_ description: String, postImage: UIImage?)
    var userImage: UIImage? { get }
    var view: AddPostViewProtocol? { get set }
}

final class AddPostViewModel: AddPostViewModelProtocol {

    private let user: UserModel
    private var presenter: DataPresenter?

    weak var view: AddPostViewProtocol?
    
    init(with user: UserModel) {
        self.user = user
    }
    
    var userImage: UIImage? {
        UIImage(named: user.userImage ?? "")
    }
    
    func addPost(_ description: String, postImage: UIImage?) {
        let post = PostModel(postId: UUID().uuidString,
                             description: description,
                             postImage: postImage,
                             user: self.user)
        
        DataPresenter.shared.addPost(with: post)
        view?.popBack()
    }
}
