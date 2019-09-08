//
//  PasswordsView+TableView.swift
//  MykiLite
//
//  Created by Awwad on 8/14/19.
//  Copyright © 2019 myki. All rights reserved.
//

import UIKit

extension PasswordsViewController {

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return viewModel.numberOfCells
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PasswordCellView
    cell.itemBackView.backgroundColor = .navBar
    let password = viewModel.getPassword(row: indexPath.row)
    cell.nicknameLabel.text = password.nickname
    cell.emailLabel.text = password.username
    cell.itemImageView.sd_setImage(with: URL(string: "http://logo.clearbit.com/\(password.url)"), placeholderImage: UIImage(named: "default"))
    return cell
  }

  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let controller = PasswordViewController()
    controller.delegate = self
    controller.viewModel = PasswordViewModel()
    controller.viewModel.password = viewModel.getPassword(row: indexPath.row)
    self.navigationController?.pushViewController(controller, animated: true)
  }

  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }

}
