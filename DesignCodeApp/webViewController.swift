//
//  webViewController.swift
//  DesignCodeApp
//
//  Created by mhd tahhan on 7/14/18.
//  Copyright © 2018 mhd tahhan. All rights reserved.
//

import UIKit
import WebKit

class webViewController: UIViewController {
    
    
    @IBOutlet weak var webView: WKWebView!
    
    var urlString: String!
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
    }
    deinit {
        webView.removeObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress))
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            if webView.estimatedProgress == 1.0 {
                navigationItem.title = webView.title
            }else {
                navigationItem.title = "loading"
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func reload(_ sender: Any) {
        webView.reload()
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func goForward(_ sender: Any) {
        webView.goForward()
    }
    // standard iOS action sheet for sharing the webpage address.
    @IBAction func actionButtonTapped(_ sender: Any) {
        let activityItems = [urlString] as! [String]
        let activityController = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityController.excludedActivityTypes = [.postToFacebook]
        present(activityController, animated: true, completion: nil)
        
    }
    
    @IBAction func safariButtonTapped(_ sender: Any) {
//        UIApplication.shared.openURL(URL(string: urlString)!)
        UIApplication.shared.openURL(URL(string: urlString)!)
    }
    
    
}
