//
//  PCWatchApiOperation.swift
//  SwiftNews
//
//  Created by Furuyama Takeshi on 2015/02/08.
//  Copyright (c) 2015年 古山 健司. All rights reserved.
//

import UIKit

class PCWatchApiOperation: HTTPOperation {
    
    init() {
        super.init(URLString:"http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.rssad.jp/rss/impresswatch/pcwatch.rdf&num=100")
    }
}
