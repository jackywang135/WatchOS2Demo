//
//  OpenSystemURLInterfaceController.swift
//  watchOS2Sampler
//
//  Created by Shuichi Tsutsumi on 2015/06/13.
//  Copyright © 2015年 Shuichi Tsutsumi. All rights reserved.
//

import WatchKit
import Foundation


class OpenSystemURLInterfaceController: WKInterfaceController {

    @IBAction func phone() {
        let url = NSURL(string: "tel:0921-637-397")!
        WKExtension.sharedExtension().openSystemURL(url)
    }

    @IBAction func sms() {
        let url = NSURL(string: "sms:")!
        WKExtension.sharedExtension().openSystemURL(url)
    }
}
