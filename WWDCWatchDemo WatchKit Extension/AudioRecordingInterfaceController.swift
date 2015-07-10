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

    @IBAction func startRecording() {
        let audioFileURL = prepareFilePathURL()
        presentAudioRecordingControllerWithOutputURL(audioFileURL, preset: .NarrowBandSpeech, maximumDuration: 30.0, actionTitle: "save") { didSave, error in
            guard error == nil && didSave == true else {
                 self.showFailure()
                 return
            }
            self.showSuccess()
        }
    }
    
    func prepareFilePathURL() -> NSURL {
        let container = NSFileManager.defaultManager().containerURLForSecurityApplicationGroupIdentifier("group.WWDCWatchDemo")!
        let fileName = "demoAudio".stringByAppendingPathExtension("mp4")!
        return container.URLByAppendingPathComponent(fileName)
    }
    
    func showSuccess() {
        self.presentAlertControllerWithTitle("Success", message: "😊", preferredStyle: .Alert, actions: [action])
    }
    
    func showFailure() {
        self.presentAlertControllerWithTitle("Failed", message: "😟", preferredStyle: .Alert, actions: [action])
    }
}
