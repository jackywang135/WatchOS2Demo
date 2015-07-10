//
//  AlertInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/10/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation


class AlertInterfaceController: WKInterfaceController {

    @IBAction func alert() {
        let action = WKAlertAction(title: "Okay", style: .Default) {}
        presentAlertControllerWithTitle("Hello", message: "alert", preferredStyle: .Alert, actions: [action])
    }
    
    @IBAction func sideBySide() {
        let defaultAction = WKAlertAction(title: "Save", style: .Default) {}
        let destructiveAction = WKAlertAction(title: "Delete", style: .Destructive) {}
        presentAlertControllerWithTitle("Hello", message: "sideBySide", preferredStyle: .SideBySideButtonsAlert, actions: [defaultAction, destructiveAction])
    }
    
    @IBAction func actionSheet() {
        let action1 = WKAlertAction(title: "Save", style: .Default) {}
        let action2 = WKAlertAction(title: "Delete", style: .Destructive) {}
        presentAlertControllerWithTitle("Hello", message: "actionSheet", preferredStyle: .ActionSheet, actions: [action1, action2])
    }
 
}
