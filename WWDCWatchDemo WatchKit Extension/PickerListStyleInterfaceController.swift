//
//  PickerListStyleInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/7/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation


class PickerListStyleInterfaceController: WKInterfaceController {

    @IBOutlet var listStylePicker: WKInterfacePicker!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        listStylePicker.setItems(setUpPickerItems())
    }
}

extension PickerListStyleInterfaceController {
    func setUpPickerItems() -> [WKPickerItem] {
        let names = ["Zonble", "Willy", "Steven", "Abe", "Oliver", "Green", "Will", "Michael", "Joe", "Daniel", "Jacky"]
        var namesPickerItems = [WKPickerItem]()
        for name in names {
            let item = WKPickerItem()
            item.title = name
            item.accessoryImage = WKImage(imageName: "KKBOX")
            namesPickerItems.append(item)
        }
        return namesPickerItems
    }
    
}
