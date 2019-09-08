//
//  PasswordViewModelTest.swift
//  MykiLiteTests
//
//  Created by Noel Achkar on 9/8/19.
//  Copyright © 2019 myki. All rights reserved.
//

import Foundation
import XCTest

@testable import MykiLite

class PasswordModelTest: XCTestCase {
    
    func testValidNickname() {
        let password = Password(uuid: UUID().uuidString.lowercased(), nickname: "JK", username: "Noel", password: "test1", url: "facebook.com")
        
        XCTAssertFalse(password.validNickname())
    }
    
    func testValidUsername() {
        let password = Password(uuid: UUID().uuidString.lowercased(), nickname: "JK", username: "Noel", password: "test1", url: "facebook.com")

        XCTAssertFalse(password.validUsername())
    }
    
    func testValidPassword() {
        let password = Password(uuid: UUID().uuidString.lowercased(), nickname: "JK", username: "Noel", password: "test1", url: "facebook.com")

        XCTAssertFalse(password.validPassword())
    }
    
    func testValidURL() {
        let password = Password(uuid: UUID().uuidString.lowercased(), nickname: "JK", username: "Noel", password: "test1", url: "facebook.com")

        XCTAssertFalse(password.validURL())
    }
}
