//
//  ViewController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/7/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import UIKit
import WatchConnectivity

public enum WatchError: ErrorType {
    case tokenError
}

class ViewController: UIViewController, WCSessionDelegate {
    
    let clientID = "dd7efe616afa85f195ff74fcc59782f7"
    let clientSecret = "3484be5d681a01f2001b9ace12b2631e"
    let redirectUri = "WWDCWatchDemo://soundcloud/callback"
    let responseType = "token"
    let authURL = "https://soundcloud.com/connect"
    
    var accessToken: String?

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        showLogin()
    }

    func showLogin() {
        let url = NSURLComponents(string: authURL)!
        url.queryItems = [
            NSURLQueryItem(name: "client_id", value: clientID),
            NSURLQueryItem(name: "client_secret", value: clientSecret),
            NSURLQueryItem(name: "response_type", value: responseType),
            NSURLQueryItem(name: "redirect_uri", value: redirectUri)]
        webView.loadRequest(NSURLRequest(URL: url.URL!))
    }
    
    func sendAccessToken() {
        if WCSession.isSupported() {
            WCSession.defaultSession().delegate = self
            WCSession.defaultSession().activateSession()
        }
        do {
            try WCSession.defaultSession().updateApplicationContext(["access_token" : accessToken!])
        }
        catch {
            //throw WatchError.tokenError
        }
    }
    

}

extension ViewController: UIWebViewDelegate {
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url = request.URL!
        let string = url.absoluteString
        let components = string.componentsSeparatedByString("access_token=")
        if components.count > 1 {
            let right = components[1]
            let left = right.componentsSeparatedByString("&expires")
            if left.count > 1 {
                accessToken = left[0]
                self.sendAccessToken()
            }
        }
        return true
    }
}

