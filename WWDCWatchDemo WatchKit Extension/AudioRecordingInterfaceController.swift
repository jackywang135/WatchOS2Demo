//
//  AudioRecordingInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/10/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation


class AudioRecordingInterfaceController: WKInterfaceController {
    
    let action = WKAlertAction(title: "Dismiss", style:.Default) {}

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
    }

    @IBAction func startRecording() {
        let fileManager = NSFileManager.defaultManager()
        let container = fileManager.containerURLForSecurityApplicationGroupIdentifier("group.WWDCWatchDemo")!
        let fileName = "demoAudio".stringByAppendingPathExtension("mp4")!
        let audioFileURL = container.URLByAppendingPathComponent(fileName)
        presentAudioRecordingControllerWithOutputURL(audioFileURL, preset: .NarrowBandSpeech, maximumDuration: 30.0, actionTitle: "save") { didSave, error in
            guard error == nil && didSave == true else {
                 self.showFailure()
                 return
            }
            self.showSuccess()
        }
    }
    
    func showSuccess() {
        self.presentAlertControllerWithTitle("Success", message: "😊", preferredStyle: .Alert, actions: [action])
    }
    
    func showFailure() {
        self.presentAlertControllerWithTitle("Failed", message: "😟", preferredStyle: .Alert, actions: [action])
    }
}
