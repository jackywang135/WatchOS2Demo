//
//  MovieMenuInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/10/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation


class MovieMenuInterfaceController: WKInterfaceController {

    let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("rafting", ofType: "mp4")!)
    
    var lastEndTime: NSTimeInterval = 0

    @IBAction func presentMediaPlayerController() {
        presentMediaPlayerControllerWithURL(url, options:[
            
            WKMediaPlayerControllerOptionsAutoplayKey: NSNumber(bool: true),
            WKMediaPlayerControllerOptionsVideoGravityKey: NSNumber(integer:WKVideoGravity.ResizeAspectFill.rawValue),
            WKMediaPlayerControllerOptionsStartTimeKey: NSNumber(double: lastEndTime),
            WKMediaPlayerControllerOptionsLoopsKey: NSNumber(bool: true)
            
            ]) { didPlayToEnd, endTime, error in
                guard error == nil else { return }
                self.lastEndTime = didPlayToEnd ? 0 : endTime
        }
    }
}
