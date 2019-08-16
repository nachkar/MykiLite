//
//  PasswordHeaderCellView.swift
//  MykiLite
//
//  Created by Awwad on 8/14/19.
//  Copyright © 2019 myki. All rights reserved.
//

import Foundation
import UIKit

class PasswordHeaderCellView: UITableViewCell {

  var itemBackgroundView = UIView()
  var itemImageView = UIImageView()

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
    itemImageView.layer.masksToBounds = true
    itemImageView.layer.borderWidth = 1
    itemImageView.layer.borderColor = UIColor.clear.cgColor
    itemImageView.image = UIImage(named: "default")

    self.contentView.addSubview(itemBackgroundView)
    itemBackgroundView.addSubview(itemImageView)
  }

  override func layoutSubviews() {
    super.layoutSubviews()

    let constraints: [NSLayoutConstraint] = [
      itemBackgroundView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
      itemBackgroundView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
      itemBackgroundView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
      itemBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

      itemImageView.centerXAnchor.constraint(equalTo: itemBackgroundView.centerXAnchor),
      itemImageView.centerYAnchor.constraint(equalTo: itemBackgroundView.centerYAnchor),
      itemImageView.widthAnchor.constraint(equalTo: itemBackgroundView.heightAnchor, multiplier: 1 / 2.5),
      itemImageView.heightAnchor.constraint(equalTo: itemBackgroundView.heightAnchor, multiplier: 1 / 2.5),
    ]

    NSLayoutConstraint.activate(constraints)
  }

  override func layoutSublayers(of layer: CALayer) {
    super.layoutSublayers(of: layer)
    itemImageView.layer.cornerRadius = itemBackgroundView.frame.height / 5
  }

}
