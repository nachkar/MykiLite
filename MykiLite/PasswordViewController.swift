//
//  PasswordViewController.swift
//  MykiLite
//
//  Created by Noel Achkar on 9/5/19.
//  Copyright © 2019 myki. All rights reserved.
//

import UIKit

class PasswordViewController: UITableViewController, UITextFieldDelegate {
    
    var viewModel: PasswordViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureNavBar()
    }
    
    @objc func editPassword() {
        
    }
    
    func configureNavBar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editPassword))
    }
    
    func configureView() {
        self.view.backgroundColor = .black
        self.navigationItem.largeTitleDisplayMode = .never
        self.tableView.separatorStyle = .none
        self.tableView.register(PasswordDisplayHeaderCellView.self, forCellReuseIdentifier: "displayHeaderCell")
        self.tableView.register(PasswordDisplayCellView.self, forCellReuseIdentifier: "displayDetailCell")
        
        
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

    }
    
    @objc func textFieldChanged(_ textField: UITextField) {
        if let text = textField.text {
            viewModel.fields[textField.tag].value = text
        }
    }
}
