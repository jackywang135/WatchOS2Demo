//
//  AccelerometerInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/15/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion

class AccelerometerInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var labelX: WKInterfaceLabel!
    @IBOutlet weak var labelY: WKInterfaceLabel!
    @IBOutlet weak var labelZ: WKInterfaceLabel!
    
    let motionManager = CMMotionManager()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        motionManager.accelerometerUpdateInterval = 0.1
    }
    
    override func willActivate() {
        super.willActivate()
        
        guard motionManager.accelerometerAvailable == true else {
            self.labelX.setText("not available")
            self.labelY.setText("not available")
            self.labelZ.setText("not available")
            return
        }
        
        let handler: CMAccelerometerHandler = { (data: CMAccelerometerData?, error: NSError?) in
            guard let data = data else { return }
            self.labelX.setText("X: \(data.acceleration.x)")
            self.labelY.setText("Y: \(data.acceleration.y)")
            self.labelZ.setText("Z: \(data.acceleration.z)")
        }
        motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: handler)
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        motionManager.stopAccelerometerUpdates()
    }
}
