//
//  AddPostViewController.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 26.08.2022.
//

import UIKit

protocol AddPostViewProtocol: AnyObject {
    func popBack()
}

class AddPostViewController: UIViewController, AddPostViewProtocol {

    // MARK: - Outlets
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var postTextView: UITextView!
    @IBOutlet private weak var userImageView: UIImageView!
    
    // MARK: - Private Properties
    private lazy var imageController: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.mediaTypes = ["public.image", "public.movie"]
        return imagePicker
    }()
    
    private enum Constants {
        static let postPlaceHolder: String = "Write something.."
    }
    
    private let viewModel: AddPostViewModelProtocol
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        self.title = "Add Post"
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        userImageView.layer.cornerRadius = 30
        userImageView.image = viewModel.userImage
        
        postTextView.delegate = self
        
        let imageButton = UIBarButtonItem(title: "Add Image", style: .plain, target: self, action: #selector(addImage))
        imageButton.tintColor = .white
        self.navigationItem.rightBarButtonItem = imageButton
    }
    
    // MARK: - Init
    init(viewModel: AddPostViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "AddPostViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    @objc private func addImage() {
        self.present(imageController, animated: true)
    }
    
    @IBAction private func addPostAction(_ sender: Any) {
        viewModel.addPost(postTextView.text, postImage: postImageView.image)
    }
    
    func popBack() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension AddPostViewController: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        if textView.text == Constants.postPlaceHolder {
            textView.text = ""
        }
        return true
    }
}

extension AddPostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.postImageView.image = pickedImage
        }
        
        dismiss(animated: true)
    }
}
