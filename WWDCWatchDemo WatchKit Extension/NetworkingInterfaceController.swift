//
//  NetworkingInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/10/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class NetworkingInterfaceController: WKInterfaceController, WCSessionDelegate {

    var dataTask : NSURLSessionDataTask?
    
    @IBOutlet var image: WKInterfaceImage!
    
    @IBAction func fetchImage() {
        
        getImageFromNetwork()
    }
    
    
    func askForAssertionWithSemaphore(semaphore:dispatch_semaphore_t) {
        NSProcessInfo.processInfo().performExpiringActivityWithReason("networkRequest") {
            expired in
            if expired == false {
                
                //System said YES!
                
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(30.0 * Double(NSEC_PER_SEC)))
                dispatch_semaphore_wait(semaphore, time)
                
            } else {
                
                //System said NO!
                
                self.releaseSemaphore(semaphore)
            }
        }
    }
    
    func getImageFromNetwork() {
        
        guard dataTask?.state != .Running else { return }
        
        let url = NSURL(string:"http://profile.ak.fbcdn.net/hprofile-ak-xap1/t5.0-1/1086526_385831701519384_1706802154_q.jpg")!
        let conf = NSURLSessionConfiguration.defaultSessionConfiguration()
        let session = NSURLSession(configuration: conf)
        
        //Create semaphore and ask for assertion
        
        let semaphore = dispatch_semaphore_create(0)
        askForAssertionWithSemaphore(semaphore)
        
        dataTask = session.dataTaskWithURL(url) { data, response, error in
            
            //Network request finished 
            
            guard error == nil, let data = data else { return }
            
            dispatch_async(dispatch_get_main_queue()) {
                self.image.setImage(UIImage(data: data))
                
                //Signal request complete
                
                self.releaseSemaphore(semaphore)
            }
        }
        dataTask!.resume()
    }
    
    func releaseSemaphore(semaphore:dispatch_semaphore_t) {
        
        //Save State
        
        dispatch_semaphore_signal(semaphore)
    }
}

