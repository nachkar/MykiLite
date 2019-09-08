//
//  Requester.swift
//  MykiLite
//
//  Created by Noel Achkar on 9/7/19.
//  Copyright © 2019 myki. All rights reserved.
//

import Foundation
import CommonCrypto

class Requester: NSObject {
    class func pwnedPasswordRequest(password: String, completionHandler: @escaping (_ pwned: Bool) -> Void) {
        let hashedPassword = password.sha1()
        let hashPrefix = hashedPassword.prefix(5)
        let url = "https://api.pwnedpasswords.com/range/\(hashPrefix)"
        
        let request = NSMutableURLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, err -> Void in
            if data != nil {
                let dataString = String(decoding: data!, as: UTF8.self)
                
                if dataString.contains(hashedPassword.dropFirst(5).uppercased()) {
                    completionHandler(true)
                } else {
                    completionHandler(false)
                }
                
            }
        })
        
        task.resume()
    }
}

extension String {
    func sha1() -> String {
        let data = Data(self.utf8)
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0.baseAddress, CC_LONG(data.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
}
