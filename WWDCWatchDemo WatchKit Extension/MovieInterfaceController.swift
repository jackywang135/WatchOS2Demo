//
//  MovieInterfaceController.swift
//  WWDCWatchDemo
//
//  Created by Jacky Wang on 7/9/15.
//  Copyright © 2015 Jacky Wang. All rights reserved.
//

import WatchKit
import Foundation


class MovieInterfaceController: WKInterfaceController {

    @IBOutlet var moviePlayer: WKInterfaceMovie!
    
    let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("jump", ofType: "MOV")!)
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        moviePlayer.setMovieURL(url)
        moviePlayer.setPosterImage(WKImage(imageName: "jumpOnDragon"))
    }
}
