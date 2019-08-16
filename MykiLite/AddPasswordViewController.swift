//
//  AddPasswordViewController.swift
//  MykiLite
//
//  Created by Awwad on 8/13/19.
//  Copyright © 2019 myki. All rights reserved.
//

import UIKit

class AddPasswordViewController: UITableViewController, UITextFieldDelegate {

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
    database.createOrUpdate(model: viewModel.password!, with: PasswordObject.init)
  }

  @objc func textFieldChanged(_ textField: UITextField) {
    if let text = textField.text {
      viewModel.fields[textField.tag].value = text
    }
  }

}
