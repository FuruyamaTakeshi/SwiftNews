//
//  DetailViewController.swift
//  SwiftNews
//
//  Created by 古山 健司 on 2014/11/02.
//  Copyright (c) 2014年 古山 健司. All rights reserved.
//

import UIKit
import Social

class DetailViewController : UIViewController , UIWebViewDelegate {
    
    @IBOutlet weak var webView: UIWebView!
    var entry = NSDictionary()
    
    var activityIndicator = UIActivityIndicatorView()
    
    @IBAction func twitter(sender: AnyObject) {
        
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            var controller = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            // リンクを追加する
            var link = entry["link"] as String
            var url = NSURL(string: link)
            controller.addURL(url)
            
            // テキストを追加
            var title = entry["title"] as String
            controller.setInitialText(title)
            
            // 投稿画面を表示する
            presentViewController(controller, animated: true, completion: {})
        }
    }
    
    @IBAction func facebook(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            var controller = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            // リンクを追加する
            var link = entry["link"] as String
            var url = NSURL(string: link)
            controller.addURL(url)
            
            // テキストを追加
            var title = entry["title"] as String
            controller.setInitialText(title)
            
            // 投稿画面を表示する
            presentViewController(controller, animated: true, completion: {})
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url = NSURL(string: self.entry["link"] as String)
        var request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        //
    }
    
}
