//
//  AudioInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/10/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation

class AudioInterfaceController: WKInterfaceController {

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        presentMediaPlayerControllerWithURL(audioFile, options: nil) {
            didFinish, endTime, error in
        }
        
    }
    
    

}
