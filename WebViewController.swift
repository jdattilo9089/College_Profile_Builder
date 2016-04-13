//
//  WebViewController.swift
//  College Profile Builder
//
//  Created by student1 on 3/3/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    var collegeArray:[College] = [College]()

    @IBOutlet weak var activity: UIActivityIndicatorView!
    @IBOutlet weak var myWebView: UIWebView!
    var currentCollege = College()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = currentCollege.name
        var myURL = NSURL(string: currentCollege.webView)
        var myRequest = NSURLRequest(URL: myURL!)

        myWebView.loadRequest(myRequest)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func webViewDidStartLoad(webView: UIWebView) {
        self.activity.alpha = 1
        activity.startAnimating()
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        self.activity.alpha = 0
        activity.stopAnimating()

    }

}