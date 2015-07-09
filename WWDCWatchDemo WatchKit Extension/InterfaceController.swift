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
	}
}

class InterfaceController: WKInterfaceController {

	@IBOutlet var table: WKInterfaceTable!
	
	let menuOptions = ["Picker"]
	
	override func willActivate() {
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
			case "Picker":
			pushControllerWithName(Storyboard.IC.pickerMenu, context: nil)
		default: return
			
		}
	}
}

