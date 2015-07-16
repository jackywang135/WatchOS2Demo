//
//  PedometerInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/15/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion

class PedometerInterfaceController: WKInterfaceController {

    @IBOutlet weak var stepsLabel: WKInterfaceLabel!
    @IBOutlet weak var distanceLabel: WKInterfaceLabel!
    @IBOutlet weak var ascendedLabel: WKInterfaceLabel!
    @IBOutlet weak var descendedLabel: WKInterfaceLabel!

    let pedometer = CMPedometer()
    
    override func willActivate() {
        super.willActivate()
        
        guard CMPedometer.isPaceAvailable() == true else {
            stepsLabel.setText("not available")
            distanceLabel.setText("not available")
            ascendedLabel.setText("not available")
            descendedLabel.setText("not available")
            return
        }
        
        pedometer.startPedometerUpdatesFromDate(NSDate()) { data, error in
            guard let data = data else { return }
            let steps = data.numberOfSteps
            self.stepsLabel.setText("Steps:\(steps)")
            if let distance = data.distance {
                self.distanceLabel.setText("Distance:\(distance)")
            }
            if let floorAscended = data.distance {
                self.ascendedLabel.setText("Ascended:\(floorAscended)")
            }
            if let floorDescended = data.distance {
                self.descendedLabel.setText("Descended:\(floorDescended)")
            }
        }
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        pedometer.stopPedometerUpdates()
    }
}