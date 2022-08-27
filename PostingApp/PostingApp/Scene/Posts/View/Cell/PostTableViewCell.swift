//
//  PostTableViewCell.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 25.08.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let cellIdentifier: String = "PostTableViewCell"

    @IBOutlet private weak var userImageView: UIImageView!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var postDescriptionLabel: UILabel!
    @IBOutlet private weak var postImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        userImageView.layer.cornerRadius = 30
    }
    
    func configure(with post: PostModel) {
        nameLabel.text = post.user?.name ?? ""
        userNameLabel.text = post.user?.userName ?? ""
        postDescriptionLabel.text = post.description ?? ""
        userImageView.image = UIImage(named: post.user?.userImage ?? "")
        
        setPostImage(with: post.postImage)
    }
    
    private func setPostImage(with image: UIImage?) {
        guard let postImage = image else {
            self.postImageView.isHidden = true
            return
        }
        
        postImageView.image = postImage
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        postImageView.isHidden = false
    }
    
}
