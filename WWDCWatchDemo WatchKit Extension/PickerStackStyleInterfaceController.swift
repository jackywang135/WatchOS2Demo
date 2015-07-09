//
//  PickerStackStyleInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by JackyWang on 7/9/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation


class PickerStackStyleInterfaceController: WKInterfaceController {

	@IBOutlet var picker: WKInterfacePicker!
	
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
		let items : [WKPickerItem] = (0..<players.count).map {
			let item = WKPickerItem()
			item.contentImage = WKImage(imageName: players[$0])
			return item
		}
		picker.setItems(items)
        
    }
}
