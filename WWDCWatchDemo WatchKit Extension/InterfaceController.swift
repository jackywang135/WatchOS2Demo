//
//  InterfaceController.swift
//  WWDCWatchDemo WatchKit Extension
//
//  Created by Jacky Wang on 7/7/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation

struct Storyboard {
    static let menuTableRowController = "MenuTableRowController"
	
	struct IC {
		static let pickerMenu = "PickerMenuInterfaceController"
		static let pickerListStyle = "PickerListStyleInterfaceController"
		static let pickerStackStyle = "PickerStackStyleInterfaceController"
		static let pickerSequenceStyle = "PickerSequenceStyleInterfaceController"
        static let pickerCoordinatingImages = "PickerCoordinatingImagesInterfaceController"
        static let audioRecording = "AudioRecordingInterfaceController"
        static let movie = "MovieInterfaceController"
        static let movieMenu = "MovieMenuInterfaceController"
        static let audioMenu = "AudioMenuInterfaceController"
	}
}

class InterfaceController: WKInterfaceController {

}

