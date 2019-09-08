//
//  PasswordDisplayHeaderCellView.swift
//  MykiLite
//
//  Created by Noel Achkar on 9/5/19.
//  Copyright © 2019 myki. All rights reserved.
//

import Foundation
import UIKit

class PasswordDisplayHeaderCellView: UITableViewCell {
    
    var itemBackgroundView = UIView()
    var itemImageView = UIImageView()
    var nicknameLabel = UILabel()
    var emailLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clear
        
        itemBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        itemBackgroundView.backgroundColor = .darkGray
        itemBackgroundView.layer.borderWidth = 1
        itemBackgroundView.layer.borderColor = UIColor.darkGray.cgColor
        itemBackgroundView.layer.cornerRadius = 5
        
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        itemImageView.clipsToBounds = true
        itemImageView.layer.masksToBounds = true
        itemImageView.layer.borderWidth = 1
        itemImageView.layer.borderColor = UIColor.clear.cgColor
        itemImageView.contentMode = .scaleAspectFit
        
        self.contentView.addSubview(itemBackgroundView)
        itemBackgroundView.addSubview(itemImageView)
        nicknameLabel.adjustsFontSizeToFitWidth = true
        nicknameLabel.textColor = .white
        nicknameLabel.font = UIFont.boldSystemFont(ofSize: 17)
        nicknameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        emailLabel.adjustsFontSizeToFitWidth = true
        emailLabel.textColor = .white
        emailLabel.font = UIFont.systemFont(ofSize: 17)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        itemBackgroundView.addSubview(nicknameLabel)
        itemBackgroundView.addSubview(emailLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let constraints: [NSLayoutConstraint] = [
            itemBackgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            itemBackgroundView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            itemBackgroundView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            itemBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            itemImageView.leftAnchor.constraint(equalTo: itemBackgroundView.leftAnchor, constant: 10),
            itemImageView.topAnchor.constraint(equalTo: itemBackgroundView.topAnchor, constant: 10),
            itemImageView.heightAnchor.constraint(equalTo: itemBackgroundView.heightAnchor, constant: -20),
            itemImageView.widthAnchor.constraint(equalTo: itemBackgroundView.heightAnchor, constant: -20),
            
            nicknameLabel.leftAnchor.constraint(equalTo: itemImageView.rightAnchor, constant: 8),
            nicknameLabel.topAnchor.constraint(equalTo: itemImageView.topAnchor, constant: 30),
            nicknameLabel.heightAnchor.constraint(equalToConstant: 20),
            nicknameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            
            emailLabel.leftAnchor.constraint(equalTo: itemImageView.rightAnchor, constant: 8),
            emailLabel.topAnchor.constraint(equalTo: nicknameLabel.bottomAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 20),
            emailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        itemImageView.layer.cornerRadius = itemImageView.frame.height/2
    }
    
}
