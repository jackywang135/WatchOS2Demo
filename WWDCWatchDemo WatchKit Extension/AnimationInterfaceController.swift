//
//  AnimationInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/13/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation


class AnimationInterfaceController: WKInterfaceController {
    @IBOutlet var image: WKInterfaceImage!
    
    @IBAction func scale() {
        animateWithDuration(0.5) {
            self.image.setWidth(30)
            self.image.setHeight(30)
        }
        delay(0.5) {
            self.animateWithDuration(0.5) {
                self.image.setWidth(120)
                self.image.setHeight(120)
            }
        }
        delay(1) {
            self.animateWithDuration(0.5) {
                self.image.setWidth(60)
                self.image.setHeight(60)
            }
        }
    }
    
    @IBAction func fade() {
        animateWithDuration(0.5) {
            self.image.setAlpha(0)
        }
        delay(0.5) {
            self.animateWithDuration(0.5) {
                self.image.setAlpha(1.0)
            }
        }
    }
    
    @IBAction func move() {
        animateWithDuration(0.5) {
            self.image.setHorizontalAlignment(.Right)
        }
        delay(0.5) {
            self.animateWithDuration(0.5) {
                self.image.setHorizontalAlignment(.Left)
            }
        }
        delay(1) {
            self.animateWithDuration(0.5) {
                self.image.setHorizontalAlignment(.Center)
            }
        }
    }
}

func delay(delay: NSTimeInterval, closure:() -> ()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), closure)
}
