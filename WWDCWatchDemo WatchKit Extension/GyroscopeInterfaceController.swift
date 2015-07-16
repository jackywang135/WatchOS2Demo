//
//  GyroscopeInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/15/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion

class GyroscopeInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var labelX: WKInterfaceLabel!
    @IBOutlet weak var labelY: WKInterfaceLabel!
    @IBOutlet weak var labelZ: WKInterfaceLabel!
    
    let motionManager = CMMotionManager()
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        motionManager.gyroUpdateInterval = 0.1
    }
    
    override func willActivate() {
        super.willActivate()
        
        guard motionManager.gyroAvailable == true else {
            self.labelX.setText("not available")
            self.labelY.setText("not available")
            self.labelZ.setText("not available")
            return
        }
        
        let handler: CMGyroHandler = { (data: CMGyroData?, error: NSError?) in
            guard let data = data else { return }
            self.labelX.setText("X:\(data.rotationRate.x)")
            self.labelY.setText("Y:\(data.rotationRate.y)")
            self.labelZ.setText("Z:\(data.rotationRate.z)")
        }
        motionManager.startGyroUpdatesToQueue(NSOperationQueue.currentQueue()!, withHandler: handler)
    }
    
    override func didDeactivate() {
        super.didDeactivate()
        motionManager.stopGyroUpdates()
    }
}
