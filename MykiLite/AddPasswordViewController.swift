//
//  AddPasswordViewController.swift
//  MykiLite
//
//  Created by Awwad on 8/13/19.
//  Copyright © 2019 myki. All rights reserved.
//

import UIKit

protocol AddPasswordDelegate: class {
    func reloadPasswordList()
}

class AddPasswordViewController: UITableViewController, UITextFieldDelegate {
    
    weak var delegate: AddPasswordDelegate!
    var viewModel: AddPasswordViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = AddPasswordViewModel()
        configureNavBar()
        configureView()
    }
    
    func configureNavBar() {
        self.title = "Add Password"
        self.navigationItem.largeTitleDisplayMode = .never
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(savePassword))
    }
    
    func configureView() {
        self.view.backgroundColor = .black
        self.tableView.separatorStyle = .none
        self.tableView.register(PasswordHeaderCellView.self, forCellReuseIdentifier: "headerCell")
        self.tableView.register(DetailCellView.self, forCellReuseIdentifier: "detailCell")
    }
    
    @objc func savePassword() {
        var nickname = ""
        var username = ""
        var password = ""
        var website = ""
        
        for field in viewModel.fields {
            if field.title == "Nickname" {
                nickname = field.value
            } else if field.title == "Username | Email" {
                username = field.value
            } else if field.title == "Password" {
                password = field.value
            } else if field.title == "Website" {
                website = field.value
            }
        }
        
        let item = ["uuid":UUID().uuidString,"nickname":nickname,"username":username,"url":website,"password":password]
        
        Requester.pwnedPasswordRequest(password: password) { (pwned) in
            if pwned {
                OperationQueue.main.addOperation {
                    let alert = UIAlertController(title: "PWNED", message: "This password has been seen before, continue?", preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: { action in
                        self.viewModel.updatePassword(item: item as NSDictionary)
                        database.createOrUpdate(model: self.viewModel.password!, with: PasswordObject.init)
                        self.delegate.reloadPasswordList()
                        self.navigationController?.popViewController(animated: true)
                        }))
                    
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
                        self.dismiss(animated: true, completion: nil)
                    }))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                OperationQueue.main.addOperation {
                    self.viewModel.updatePassword(item: item as NSDictionary)
                    database.createOrUpdate(model: self.viewModel.password!, with: PasswordObject.init)
                    self.delegate.reloadPasswordList()
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
    
    @objc func textFieldChanged(_ textField: UITextField) {
        if let text = textField.text {
            viewModel.fields[textField.tag].value = text
        }
    }
    
}
