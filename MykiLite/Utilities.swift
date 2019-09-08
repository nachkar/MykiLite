//
//  Utilities.swift
//  MykiLite
//
//  Created by Noel Achkar on 9/8/19.
//  Copyright © 2019 myki. All rights reserved.
//

import Foundation
import UIKit

class Utilities: NSObject {
    class func verifyUrl (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = URL(string: urlString) {
                return UIApplication.shared.canOpenURL(url)
            }
        }
        return false
    }}
