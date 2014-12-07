//
//  DataManager.swift
//  SwiftNews
//
//  Created by 古山 健司 on 2014/11/15.
//  Copyright (c) 2014年 古山 健司. All rights reserved.
//

import Foundation
import CoreData

private let manager = DataManager()

class DataManager {

    private init() {}
    
    class func sharedManager() -> DataManager {
        return manager
    }
    
    func insertObject() -> AnyObject? {
        return nil;
    }
    
    func save() {
        
    }
    
    class func update() {
        
    }
    
    func delete() {
        
    }
    
}
