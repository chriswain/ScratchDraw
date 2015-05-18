//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Christopher Wainwright Aaron on 5/14/15.
//  Copyright (c) 2015 Chris Aaron. All rights reserved.
//

import UIKit

var fillColors: [UIColor] = [
    UIColor.magentaColor(),
    UIColor.cyanColor(),
    UIColor.yellowColor(),
    UIColor.blackColor()
]

class ViewController: UIViewController {
    
    @IBAction func clearLines(sender: AnyObject) {
        scratchPad.scratches = []
        scratchPad.setNeedsDisplay()
    }
    
    @IBOutlet weak var scratchPad: ScratchView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
   //     view.addSubview(scratchPad)
   //     scratchPad.frame = view.frame
   //     scratchPad.backgroundColor = UIColor.whiteColor()
        
    }

    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if let touch = touches.first as? UITouch {
            let location = touch.locationInView(scratchPad)
            scratchPad.newScratchWithStartPoint(location)

        }
        
    }
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        if let touch = touches.first as? UITouch {
            let location = touch.locationInView(scratchPad)
    
              scratchPad.updateCurrentScratchWithLastPoint(location)
       //     scratchPad.addPointToCurrentScratch(location)
        }
        
    }
    
        
    @IBAction func changeColor(sender: UIButton) {
        
        
        scratchPad.currentColor = sender.backgroundColor!
        
    }
    

}

