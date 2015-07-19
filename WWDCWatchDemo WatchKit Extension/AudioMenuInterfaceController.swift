//
//  AudioMenuInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/10/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation

let audioFile = NSBundle.mainBundle().URLForResource("One Man Can Change the World", withExtension: "mp3")!

class AudioMenuInterfaceController: WKInterfaceController {

    var player: WKAudioFilePlayer?
    @IBAction func modal() {
        presentMediaPlayerControllerWithURL(audioFile, options: nil) {
            didFinish, endTime, error in
        }
    }
}

