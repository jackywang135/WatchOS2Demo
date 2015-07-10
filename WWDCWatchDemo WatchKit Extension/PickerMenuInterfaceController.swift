//
//  PickerMenuInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by JackyWang on 7/9/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation


let players = ["kobe", "jordan", "love", "westbrook", "duncan", "griffin", "magic", "shaq", "durant", "bird", "carmelo", "rose", "paul", "iverson", "curry"]

class PickerMenuInterfaceController: WKInterfaceController {

	@IBOutlet var table: WKInterfaceTable!
	
	let menuOptions = ["List", "Stack", "Sequence", "Coordinating Images"]
	
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        setUpTable(menuOptions)
    }
	
	func setUpTable(menu:[String]) {
		table.setNumberOfRows(menu.count, withRowType: Storyboard.menuTableRowController)
		for index in 0..<menu.count {
			let rowController = table.rowControllerAtIndex(index) as! MenuTableRowController
			rowController.label.setText(menu[index])
		}
	}
	
	override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
		switch menuOptions[rowIndex] {
		case "List":
			pushControllerWithName(Storyboard.IC.pickerListStyle, context: nil)
		case "Stack":
			pushControllerWithName(Storyboard.IC.pickerStackStyle, context: nil)
		case "Sequence":
			pushControllerWithName(Storyboard.IC.pickerSequenceStyle, context: nil)
        case "Coordinating Images":
            pushControllerWithName(Storyboard.IC.pickerCoordinatingImages, context: nil)
		default: return
		}
	}
}
