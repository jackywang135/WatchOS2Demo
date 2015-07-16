//
//  PickerCoordinatingImagesInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/10/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation


class PickerCoordinatingImagesInterfaceController: WKInterfaceController {

    @IBOutlet var group: WKInterfaceGroup!
    
    @IBOutlet var picker: WKInterfacePicker!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        let images: [UIImage] = (0..<24).map {
            return UIImage(named: "Play\($0)")!
        }
        let pickerItems: [WKPickerItem] = (0..<24).map {
            let item = WKPickerItem()
            item.title = "\( Int(Double($0) * 100.0 / 23.0))%"
            return item
        }
        let progressImage = UIImage.animatedImageWithImages(images, duration: 0.0)
        group.setBackgroundImage(progressImage)
        picker.setCoordinatedAnimations([group])
        picker.setItems(pickerItems)
    }

}
