//
//  Requester.swift
//  MykiLite
//
//  Created by Noel Achkar on 9/7/19.
//  Copyright © 2019 myki. All rights reserved.
//

import Foundation
import SwiftyJSON

class Requester: NSObject {
    class func getWebIcon(domaineName: String, completionHandler: (([Any]?) -> Void)?) {
        let url = "https://logo.clearbit.com/\(domaineName)"
        
        let request = NSMutableURLRequest(url: URL(string: url)!)
        let session = URLSession.shared
        
        request.httpMethod = "GET"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, err -> Void in
            if data != nil {
                do {
                    let json = try JSON(data: data!)
                    var searchResults: [JSON]?
                    
                    searchResults = json["results"].arrayValue
                    
                    completionHandler?(searchResults)
                } catch {
                    print("An error has occured")
                }
            }
        })
        
        task.resume()
    }
}
