//
//  AudioBackgroundPlayerInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/13/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation


class AudioBackgroundPlayerInterfaceController: WKInterfaceController {

    var player: WKAudioFilePlayer!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let asset = WKAudioFileAsset(URL: audioFile, title: "One Man Can Change the World", albumTitle: "Dark Sky Paradise", artist: "Big Sean")
        let playerItem = WKAudioFilePlayerItem(asset: asset)
        player = WKAudioFilePlayer(playerItem: playerItem)
    }

    @IBAction func play() {
        guard player.status == .ReadyToPlay else { return }
        player.play()
    }

    @IBAction func pause() {
       player.pause()
    }
    
    

}
