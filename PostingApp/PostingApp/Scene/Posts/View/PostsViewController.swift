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
    private var dataSource: PostTableViewDatasource?
    
    // MARK: - Outlets
    @IBOutlet private weak var segmentedControl: UISegmentedControl!
    @IBOutlet private weak var selectUserButton: UIButton!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var pickerBottomConst: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        viewModel.load(false)
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
        selectUserButton.setTitle(viewModel.selectedUser?.name ?? "Select User", for: .normal)
        
        tableView.registerNib(nibName: "PostTableViewCell", cellIdentifier: PostTableViewCell.cellIdentifier)
        dataSource = PostTableViewDatasource()
        tableView.dataSource = dataSource
        
        segmentedControl.selectedSegmentIndex = 1

    }
    
    @IBAction private  func selectUserAction(_ sender: Any) {
        animatePicker()
    }
    
    @objc private func dismissPicker() {
        animatePicker()
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        viewModel.load(sender.selectedSegmentIndex == 0)
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
        viewModel.users[row].name ?? ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.selectedUser = viewModel.users.get(row)
        let name = viewModel.users.get(row)?.name ?? ""
        selectUserButton.setTitle(name, for: .normal)
        animatePicker()
        
        if segmentedControl.selectedSegmentIndex == 0 {
            reloadPosts()
        }
    }
}

extension PostsViewController: PostsViewProtocol {
    func reloadPicker() {
        pickerView.reloadAllComponents()
    }
    
    func reloadPosts() {
        dataSource?.update(with: viewModel)
        tableView.reloadData()
    }
}
