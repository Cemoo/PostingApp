//
//  PostsViewController.swift
//  PostingApp
//
//  Created by Cemal Bayrı on 25.08.2022.
//

import UIKit

protocol PostsViewProtocol: AnyObject {
    func reloadPicker()
    func reloadPosts()
}

class PostsViewController: UIViewController {
    
    // MARK: - Private Properties
    private let viewModel: PostsViewModelProtocol
    private var pickerOpened: Bool = false
    
    // MARK: - Outlets
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var selectUserButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var pickerBottomConst: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    // MARK: - Init
    init(with viewModel: PostsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "PostsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func setUI() {
        self.title = "Posts"
        
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white
        ]
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissPicker)))
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        selectUserButton.layer.borderColor = UIColor.white.cgColor
        selectUserButton.layer.borderWidth = 0.5
        selectUserButton.layer.cornerRadius = 8
        selectUserButton.setTitle(viewModel.users.first?.name ?? "Select User", for: .normal)
    }
    
    @IBAction func selectUserAction(_ sender: Any) {
        animatePicker()
    }
    
    @objc private func dismissPicker() {
        animatePicker()
    }
    
    private func animatePicker() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.1) { [weak self] in
                guard let self = self else { return }
                self.pickerBottomConst.constant = self.pickerOpened ? -200 : 0
                self.pickerOpened.toggle()
                self.view.layoutIfNeeded()
            }
        }
    }
    
}

extension PostsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int { 1 }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.users.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.users[row].name ?? ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let name = viewModel.users[row].name ?? ""
        selectUserButton.setTitle(name, for: .normal)
        animatePicker()
    }
}

extension PostsViewController: PostsViewProtocol {
    func reloadPicker() {
        pickerView.reloadAllComponents()
    }
    
    func reloadPosts() {
        tableView.reloadData()
    }
}
