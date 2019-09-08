//
//  Password.swift
//  MykiLite
//
//  Created by Awwad on 8/14/19.
//  Copyright © 2019 myki. All rights reserved.
//

import Foundation

struct Password {
  var uuid: String = ""
  var nickname: String = ""
  var username: String = ""
  var password: String = ""
  var url: String = ""
}

extension Password {
  init(object: PasswordObject) {
    self.uuid = object.uuid
    self.nickname = object.nickname
    self.username = object.username
    self.password = object.password
    self.url = object.url
  }

  init(object: NSDictionary) {
    if let uuid = object["uuid"] as? String {
      self.uuid = uuid
    }

    if let nickname = object["nickname"] as? String {
      self.nickname = nickname
    }

    if let username = object["username"] as? String {
      self.username = username
    }

    if let password = object["password"] as? String {
      self.password = password
    }

    if let url = object["url"] as? String {
      self.url = url
    }
  }
    
    func validNickname() -> Bool {
        return nickname.count > 3
    }
    
    func validUsername() -> Bool {
        return username.count > 5
    }
    
    func validPassword() -> Bool {
        return password.count > 6
    }
    
    func validURL() -> Bool {
        return url.count > 5 && Utilities.verifyUrl(urlString: url)
    }
}
