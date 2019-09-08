//
//  PasswordDisplayCellView.swift
//  MykiLite
//
//  Created by Noel Achkar on 9/5/19.
//  Copyright © 2019 myki. All rights reserved.
//

import Foundation
import UIKit

class PasswordDisplayCellView: UITableViewCell {
    
    var infoBackgroundView = UIView()
    var titleLabel = UILabel()
    var detailTextField = UITextField()
    var copyButton = UIButton()
    var password: String!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        infoBackgroundView.layer.masksToBounds = true
        infoBackgroundView.layer.borderWidth = 1
        infoBackgroundView.layer.borderColor = UIColor.clear.cgColor
        
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .grayG
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        
        detailTextField.adjustsFontSizeToFitWidth = true
        detailTextField.textColor = .white
        detailTextField.font = UIFont.systemFont(ofSize: 16)
        detailTextField.autocorrectionType = .no
        
        copyButton.isHidden = true
        copyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        copyButton.setTitle("COPY", for: .normal)
        copyButton.setTitleColor(.mykiGreen, for: .normal)
        copyButton.addTarget(self, action: #selector(copyPressed), for: .touchUpInside)
        
        self.contentView.addSubview(infoBackgroundView)
        infoBackgroundView.addSubview(titleLabel)
        infoBackgroundView.addSubview(detailTextField)
        infoBackgroundView.addSubview(copyButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        infoBackgroundView.layer.cornerRadius = 3.0
        infoBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        detailTextField.translatesAutoresizingMaskIntoConstraints = false
        copyButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoBackgroundView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            infoBackgroundView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            infoBackgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            infoBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            titleLabel.leftAnchor.constraint(equalTo: infoBackgroundView.leftAnchor, constant: 10),
            titleLabel.rightAnchor.constraint(equalTo: infoBackgroundView.rightAnchor, constant: -10),
            titleLabel.topAnchor.constraint(equalTo: infoBackgroundView.topAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            detailTextField.leftAnchor.constraint(equalTo: infoBackgroundView.leftAnchor, constant: 10),
            detailTextField.rightAnchor.constraint(equalTo: infoBackgroundView.rightAnchor, constant: -10),
            detailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            detailTextField.heightAnchor.constraint(equalToConstant: 18),
            
            copyButton.rightAnchor.constraint(equalTo: infoBackgroundView.rightAnchor, constant: -20),
            copyButton.heightAnchor.constraint(equalToConstant: 18),
            copyButton.centerYAnchor.constraint(equalTo: infoBackgroundView.centerYAnchor),
            ])
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
    }
    
    @objc func copyPressed() {
        let pasteBoard = UIPasteboard.general
        
        if detailTextField.text == "Hold to reveal item" {
            pasteBoard.string = password

            return
        }
        
        pasteBoard.string = detailTextField.text
    }
    
}
