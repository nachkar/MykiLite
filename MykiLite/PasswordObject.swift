//
//  PasswordObject.swift
//  MykiLite
//
//  Created by Awwad on 8/14/19.
//  Copyright © 2019 myki. All rights reserved.
//

import Foundation
import RealmSwift

final class PasswordObject: Object {
  @objc dynamic var uuid: String = UUID().uuidString.lowercased()
  @objc dynamic var nickname: String = ""
  @objc dynamic var username: String = ""
  @objc dynamic var password: String = ""
  @objc dynamic var url: String = ""

  override static func primaryKey() -> String? {
    return "uuid"
  }
}

extension PasswordObject {
  convenience init(password: Password) {
    self.init()

    self.uuid = password.uuid
    self.nickname = password.nickname
    self.username = password.username
    self.password = password.password
    self.url = password.url
  }
}
