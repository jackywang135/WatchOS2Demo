//
//  TapticInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/15/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation


class TapticInterfaceController: WKInterfaceController {

    @IBOutlet var picker: WKInterfacePicker!
    var pickerItems = [WKPickerItem]()
    var currentItem : WKPickerItem!
    
    var hapticTypes = [
        "Notification": WKHapticType.Notification,
        "DirectionUp": WKHapticType.DirectionUp,
        "DirectionDown": WKHapticType.DirectionDown,
        "Success": WKHapticType.Success,
        "Failure": WKHapticType.Failure,
        "Retry": WKHapticType.Retry,
        "Start": WKHapticType.Start,
        "Stop": WKHapticType.Stop,
        "Click": WKHapticType.Click,
    ]
    
    override func willActivate() {
        super.willActivate()
        for typeStr in hapticTypes.keys {
            let pickerItem = WKPickerItem()
            pickerItem.title = typeStr
            pickerItems.append(pickerItem)
        }
        picker.setItems(pickerItems)
        currentItem = pickerItems.first
    }
    
    @IBAction func pickerItemSelected(value: Int) {
        currentItem = pickerItems[value]
    }
    
    @IBAction func tap() {
        let hapticType = hapticTypes[currentItem.title!]
        WKInterfaceDevice.currentDevice().playHaptic(hapticType!)
        
    }
}
