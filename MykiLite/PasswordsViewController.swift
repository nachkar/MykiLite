//
//  PasswordsViewController.swift
//  MykiLite
//
//  Created by Awwad on 8/13/19.
//  Copyright © 2019 myki. All rights reserved.
//

import UIKit

class PasswordsViewController: UITableViewController, AddPasswordDelegate, PasswordDelegate {
    func reloadPasswordList() {
        self.tableView.reloadData()
    }

  var viewModel: PasswordsViewModel!

  override func viewDidLoad() {
    super.viewDidLoad()

    viewModel = PasswordsViewModel()
    configureNavBar()
    configureView()
  }

  @objc func addPassword() {
    let controller = AddPasswordViewController()
    controller.delegate = self
    self.navigationController?.pushViewController(controller, animated: true)
  }

  func configureNavBar() {
    self.title = "Passwords"
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addPassword))
  }

  func configureView() {
    self.view.backgroundColor = .darkGray
    self.tableView.separatorStyle = .none
    self.tableView.register(PasswordCellView.self, forCellReuseIdentifier: "cell")
  }

}
