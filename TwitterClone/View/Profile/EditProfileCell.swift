//
//  EditProfileCell.swift
//  TwitterClone
//
//  Created by jb on 2020/05/18.
//  Copyright © 2020 DJ. All rights reserved.
//

import UIKit

protocol EditProfileCellDelegate: class {
    func updateUserInfo(_ cell: EditProfileCell)
}

class EditProfileCell: UITableViewCell {
    // MARK: - Properties
//    var viewModel: EditProfileViewModel? {
//        didSet{
//            configure()
//        }
//    }
    weak var delegate: EditProfileCellDelegate?
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    lazy var infoTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.font = UIFont.systemFont(ofSize: 14)
        tf.textAlignment = .left
        tf.textColor = .twitterBlue
        tf.addTarget(self, action: #selector(handleUpdateUserInfo), for: .editingDidEnd)
        tf.text = "Test User Attribute"
        
        return tf
    }()
    
//    let bioTextView: InputTextView = {
//        let tv = InputTextView()
//        tv.font = UIFont.systemFont(ofSize: 14)
//        tv.textColor = .twitterBlue
//        tv.placeholderLabel.text = "Bio"
//        return tv
//    }()
    
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    @objc func handleUpdateUserInfo(){
        delegate?.updateUserInfo(self)
    }
    
    // MARK: - Helpers
//    func configure(){
//        guard let viewModel = viewModel else { return }
//        infoTextField.isHidden = viewModel.shouldHideTextField
//        bioTextView.isHidden = viewModel.shouldHideTextView
//
//        titleLabel.text = viewModel.titleText
//        infoTextField.text = viewModel.optionValue
//        bioTextView.text = viewModel.optionValue
//    }
    
}
