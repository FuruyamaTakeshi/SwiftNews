//
//  HTTPOperation.swift
//  SwiftNews
//
//  Created by Furuyama Takeshi on 2015/02/08.
//  Copyright (c) 2015年 古山 健司. All rights reserved.
//

import UIKit

class HTTPOperation: NSOperation {
    
    var newsUrlStrings : NSMutableArray?
    var URLString : String?
    var entries :NSMutableArray?
    var number : Int16
    
    init(URLString: String) {
        self.entries = NSMutableArray()
        self.URLString = URLString
        self.number = 10
        super.init()
    }

    func executing() -> Bool {
        return true
    }
    
    override func start() {
        println(self.URLString)
        let url = NSURL(string: self.URLString!)
        
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { data, response, error in
            var dict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
            if var responseData = dict["responseData"] as? NSDictionary {
                if var feed = responseData["feed"] as? NSDictionary {
                    if var entries = feed["entries"] as? NSMutableArray {
                        self.entries = entries
                    }
                }
            }
        })
        task.resume()
    }
}
