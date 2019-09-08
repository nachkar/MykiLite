//
//  PasswordView+TableView.swift
//  MykiLite
//
//  Created by Noel Achkar on 9/5/19.
//  Copyright © 2019 myki. All rights reserved.
//

import UIKit

extension PasswordViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let field = viewModel.fields[indexPath.row]
        switch field.type {
        case .header:
            return getHeaderCell(indexPath: indexPath)
        default:
            return getFieldCell(indexPath: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let field = viewModel.fields[indexPath.row]
        switch field.type {
        case .header:
            return 120
        default:
            return 80
        }
    }
    
    func getHeaderCell(indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "displayHeaderCell", for: indexPath) as! PasswordDisplayHeaderCellView
        cell.selectionStyle = .none
        cell.clipsToBounds = true
        cell.emailLabel.text = viewModel.password.username
        cell.nicknameLabel.text = viewModel.password.nickname
        
        for field in viewModel.fields {
            if field.title == "Website" {
                cell.itemImageView.sd_setImage(with: URL(string: "http://logo.clearbit.com/\(field.value)"), placeholderImage: UIImage(named: "default"))
            }
        }
        
        return cell
    }
    
    func getFieldCell(indexPath: IndexPath) -> UITableViewCell {
        let field = viewModel.fields[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "displayDetailCell", for: indexPath) as! PasswordDisplayCellView
        cell.titleLabel.text = field.title
        cell.detailTextField.text = field.value
        cell.detailTextField.isSecureTextEntry = field.isSecure        
        cell.password = viewModel.password.password

        if field.title == "Password" {
            cell.addGestureRecognizer(passwordLongPressGesture)
            
            if viewModel.isPasswordVisible {
                cell.detailTextField.text = field.value
            } else {
                cell.detailTextField.text = "Hold to reveal item"
            }
        }
        
        if field.title == "Username" || field.title == "Password" {
            cell.copyButton.isHidden = false
        }
        
        cell.detailTextField.isEnabled = viewModel.isEditing
        
        cell.clipsToBounds = true
        cell.selectionStyle = .none
        cell.detailTextField.tintColor = .mykiGreen
        cell.infoBackgroundView.backgroundColor = .darkGray
        cell.detailTextField.autocapitalizationType = .none
        cell.detailTextField.keyboardAppearance = .dark

        cell.detailTextField.delegate = self
        cell.detailTextField.addTarget(self, action: #selector(self.textFieldChanged(_:)), for: .editingChanged)
        cell.detailTextField.tag = indexPath.row
        
        return cell
    }
}
