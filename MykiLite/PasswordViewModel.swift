//
//  PasswordViewModel.swift
//  MykiLite
//
//  Created by Noel Achkar on 9/5/19.
//  Copyright © 2019 myki. All rights reserved.
//

import Foundation

class PasswordViewModel {
    
    var password: Password!
    var fields: [Field] = []
    
    var numberOfCells: Int {
        return fields.count
    }
    
    init() {
        prepareFields()
    }
    
    func prepareFields() {
        let items: [NSDictionary] = [["title": "Header", "type": FieldTypes.header, "secure": false], ["title": "Nickname", "type": FieldTypes.text, "secure": false], ["title": "Username", "type": FieldTypes.text, "secure": false], ["title": "Password", "type": FieldTypes.password, "secure": false], ["title": "Website", "type": FieldTypes.text, "secure": false]]
        
        for item in items {
            guard let title = item["title"] as? String, let type = item["type"] as? FieldTypes, let isSecure = item["secure"] as? Bool else { continue }
            fields.append(Field(title: title, type: type, isSecure: isSecure))
        }
        
        
    }
    
    func updatePassword(item: NSDictionary) {
        password = Password(object: item)
    }
}


