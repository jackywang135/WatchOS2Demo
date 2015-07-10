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

    let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("jump", ofType: "MOV")!)

    @IBAction func presentMediaPlayerController() {
        presentMediaPlayerControllerWithURL(url, options:[
            WKMediaPlayerControllerOptionsAutoplayKey: NSNumber(bool: true),
            WKMediaPlayerControllerOptionsVideoGravityKey: NSNumber(integer:WKVideoGravity.ResizeAspectFill.rawValue),
            WKMediaPlayerControllerOptionsStartTimeKey: NSNumber(float: 2.0),
            WKMediaPlayerControllerOptionsLoopsKey: NSNumber(bool: true)
            ]) { didPlayToEnd, endTime, error in
            
                //DidPlayToEnd: indicating whether the file played to end 
                
                //EndTime: End Time 
        }
    }
}
