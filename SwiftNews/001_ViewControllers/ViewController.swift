//
//  ViewController.swift
//  SwiftNews
//
//  Created by 古山 健司 on 2014/11/02.
//  Copyright (c) 2014年 古山 健司. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var entries = NSMutableArray()
    var newsUrlStrings = [
        "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.rssad.jp/rss/impresswatch/pcwatch.rdf&num=100",
        "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://rss.itmedia.co.jp/rss/2.0/news_bursts.xml&num=8",
        "http://ajax.googleapis.com/ajax/services/feed/load?v=1.0&q=http://jp.techcrunch.com/feed/&num=8"
    ]

    @IBAction func refresh(sender: AnyObject) {
        
        entries.removeAllObjects()
        let url = NSURL(string: newsUrlStrings[0])
        var task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { data, response, error in
            var dict = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
            if var responseData = dict["responseData"] as? NSDictionary {
                if var feed = responseData["feed"] as? NSDictionary {
                    if var entries = feed["entries"] as? NSMutableArray {
                        self.entries = entries
                    }
                }
            }
            dispatch_async(dispatch_get_main_queue(), {
                self.tableView .reloadData()
            })
        })
        task.resume()
    }
    
    let iphones = ["iPhone", "iPhone 3G", "iPhone 3GS", "iPhone 4", "iPhone 4S", "iPhone5", "iPhone 5S", "iPhone 6", "iPhone 6 Plus"]
    let years = ["2007", "2008", "2008", "2010", "2011", "2012", "2013", "2014", "2014"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.refresh(self)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("news") as UITableViewCell
        
        var entry = entries[indexPath.row] as NSDictionary
        
        var titleLabel = cell.viewWithTag(1) as UILabel
        titleLabel.text = entry["title"] as? String
        
        var descriptionLabel = cell.viewWithTag(2) as UILabel
        descriptionLabel.text = entry["contentSnippet"] as? String
        
        var dateLabel = cell.viewWithTag(3) as UILabel
        dateLabel.text = entry["publishedDate"] as? String

        return cell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        performSegueWithIdentifier("detail", sender: entries[indexPath.row])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail" {
            var detailController = segue.destinationViewController as DetailViewController
            detailController.entry = sender as NSDictionary
        }
    }

}

