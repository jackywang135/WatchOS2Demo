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
    override func willActivate() {
        super.willActivate()
       
    }
    @IBAction func modal() {
        presentMediaPlayerControllerWithURL(audioFile, options: nil) {
            didFinish, endTime, error in
        }
    }

    @IBAction func background() {
        let asset = WKAudioFileAsset(URL: audioFile, title: "One Man Can Change the World", albumTitle: "Dark Sky Paradise", artist: "Big Sean")
        let playerItem = WKAudioFilePlayerItem(asset: asset)
        player = WKAudioFilePlayer(playerItem: playerItem)
        addObserver(self, forKeyPath: "player.status", options: NSKeyValueObservingOptions.New, context: nil)
        dispatch_async(dispatch_get_main_queue()) {
            delay(5.0) {
                self.player!.play()
            }
        }
        
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        player!.play()
    }
}

func delay(delay: NSTimeInterval, closure:() -> ()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}
