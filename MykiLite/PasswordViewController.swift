//
//  PasswordViewController.swift
//  MykiLite
//
//  Created by Noel Achkar on 9/5/19.
//  Copyright © 2019 myki. All rights reserved.
//

import UIKit

protocol PasswordDelegate: class {
    func reloadPasswordList()
}

class PasswordViewController: UITableViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
    
    var viewModel: PasswordViewModel!
    weak var delegate: PasswordDelegate!
    
    var passwordLongPressGesture: UILongPressGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureNavBar()
    }
    
    @objc func editPassword() {
        viewModel.isEditing = true
        tableView.reloadData()
        
        let saveBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(savePassword))
        self.navigationItem.rightBarButtonItem = saveBarButtonItem
    }
    
    @objc func savePassword() {
        viewModel.isEditing = false
        tableView.reloadData()
        
        var nickname = ""
        var username = ""
        var password = ""
        var website = ""
        
        for field in viewModel.fields {
            if field.title == "Nickname" {
                nickname = field.value
            } else if field.title == "Username" {
                username = field.value
            } else if field.title == "Password" {
                password = field.value
            } else if field.title == "Website" {
                website = field.value
            }
        }
        
        let passwordToUpdate = database.fetch(with: Password.all).first!
        
        let item = ["uuid":passwordToUpdate.uuid,"nickname":nickname,"username":username,"url":website,"password":password]
        
        viewModel.updatePassword(item: item as NSDictionary)
        
        database.createOrUpdate(model: viewModel.password!, with: PasswordObject.init)
        
        self.delegate.reloadPasswordList()
        
        configureNavBar()
    }
    
    func configureNavBar() {
        let editBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editPassword))
        self.navigationItem.rightBarButtonItem = editBarButtonItem
    }
    
    func configureView() {
        self.view.backgroundColor = .black
        self.navigationItem.largeTitleDisplayMode = .never
        self.tableView.separatorStyle = .none
        self.tableView.register(PasswordDisplayHeaderCellView.self, forCellReuseIdentifier: "displayHeaderCell")
        self.tableView.register(PasswordDisplayCellView.self, forCellReuseIdentifier: "displayDetailCell")
        
        let deleteBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        deleteBtn.setImage(UIImage(named: "trash"), for: .normal)
        deleteBtn.addTarget(self, action: #selector(deletePressed), for: .touchUpInside)
        tableView.tableFooterView = deleteBtn
        
        for (index,field) in (viewModel.fields).enumerated() {
            if field.title == "Nickname" {
                viewModel.fields[index].value = viewModel.password.nickname
            } else if field.title == "Username" {
                viewModel.fields[index].value = viewModel.password.username
            } else if field.title == "Password" {
                viewModel.fields[index].value = viewModel.password.password
            } else if field.title == "Website" {
                viewModel.fields[index].value = viewModel.password.url
            }
        }
        
        passwordLongPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        passwordLongPressGesture.minimumPressDuration = 0.5
        passwordLongPressGesture.delaysTouchesBegan = true
        passwordLongPressGesture.delegate = self
    }
    
    @objc func deletePressed() {
        database.delete(type: PasswordObject.self, with: viewModel.password.uuid)
        
        self.delegate.reloadPasswordList()
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func textFieldChanged(_ textField: UITextField) {
        if let text = textField.text {
            viewModel.fields[textField.tag].value = text
        }
    }
    
    @objc func handleLongPress(gestureReconizer: UILongPressGestureRecognizer) {
        if gestureReconizer.state != UIGestureRecognizer.State.ended {
            viewModel.isPasswordVisible = true
        }
        else {
            viewModel.isPasswordVisible = false
        }
        tableView.reloadData()

    }
}
