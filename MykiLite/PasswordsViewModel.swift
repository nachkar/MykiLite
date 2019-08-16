//
//  PasswordsViewModel.swift
//  MykiLite
//
//  Created by Awwad on 8/13/19.
//  Copyright © 2019 myki. All rights reserved.
//

import Foundation

class PasswordsViewModel {

  var passwords: [Password] {
    return database.fetch(with: Password.all)
  }

  var numberOfCells: Int {
    return passwords.count
  }

  func getPassword(row: Int) -> Password {
    return passwords[row]
  }

}
