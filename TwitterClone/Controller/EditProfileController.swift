//
//  EditProfileController.swift
//  TwitterClone
//
//  Created by jb on 2020/05/18.
//  Copyright © 2020 DJ. All rights reserved.
//

import UIKit

private let reuseIdentifier = "EditProfileCell"
class EditProfileController: UITableViewController {
    // MARK: - Properties
    private let user: User
    private let imagePicker = UIImagePickerController()
    private lazy var headerView = EditProfileHeader(user: user)
    
    private var selectedImage: UIImage? {
        didSet{
            headerView.profileImageView.image = selectedImage
        }
    }
    
    // MARK: - Lifecycle
    init(user: User) {
        self.user = user
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       configureImagePicker()
        configureNavigationBar()
        configureTableView()
    }
    
    // MARK: - Selectors
    @objc func handleCancel(){
        dismiss(animated: true, completion: nil)
    }
    @objc func handleDone(){
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Helpers
    func configureNavigationBar(){
        navigationController?.navigationBar.barTintColor = .twitterBlue
        navigationController?.navigationBar.barStyle = .black //making white status bar(darkmode)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = .white //white tint color for buttonitems
        
        navigationItem.title = "Edit Profile"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        
        //not enabled at first
        navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func configureTableView(){
        tableView.tableHeaderView = headerView
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 180)
        tableView.tableFooterView = UIView()
        
        tableView.register(EditProfileCell.self, forCellReuseIdentifier: reuseIdentifier)
        headerView.delegate = self
    }
    
    func configureImagePicker(){
        imagePicker.delegate = self
               imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource
extension EditProfileController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EditProfileOptions.allCases.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! EditProfileCell
        cell.delegate = self
        return cell
    }
}

// MARK: - UITableViewDelegate
extension EditProfileController{
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let option = EditProfileOptions(rawValue: indexPath.row) else { return 0 }
        return option == .bio ? 100 : 48
    }
}

// MARK: - EditProfileHeaderDelegate
extension EditProfileController: EditProfileHeaderDelegate {
    func didTapChangeProfilePhoto() {
        
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension EditProfileController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        self.selectedImage = image
        dismiss(animated: true, completion: nil)
    }
}

extension EditProfileController: EditProfileCellDelegate{
    func updateUserInfo(_ cell: EditProfileCell) {
        
    }
    
    
}
