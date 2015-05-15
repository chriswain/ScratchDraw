//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Christopher Wainwright Aaron on 5/14/15.
//  Copyright (c) 2015 Chris Aaron. All rights reserved.
//

import UIKit

var sliderValue = Double(0)
var context = UIGraphicsGetCurrentContext()

class ViewController: UIViewController {
    
    @IBAction func clearStroke(sender: UIButton) {
        
        
    }
  
    
    @IBAction func clearFill(sender: UIButton) {
        if scratchPad.fillColor != UIColor.blackColor() {
            CGContextSetFillColorWithColor(context, UIColor.blackColor().CGColor)
        }
    }
    
    
    @IBAction func fillColor(sender: UIButton) {
        scratchPad.fillColor = sender.backgroundColor!
        
    }
    
    @IBAction func strokeSizeAdj(sender: UISlider) {
      scratchPad.strokeSize = Double(sender.value)
      sliderValue = Double(sender.value)
       
    
    }
    
    @IBAction func undoDraw(sender: UIButton) {
        if !scratchPad.scratches.isEmpty {
        scratchPad.scratches.removeLast()
        }
        scratchPad.setNeedsDisplay()
    }
    
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
       //     scratchPad.updateCurrentLineWithLastPoint(location)
            scratchPad.addPointToCurrentScratch(location)
        }
        
    }
    
        
    @IBAction func changeColor(sender: UIButton) {
        
        
        scratchPad.currentColor = sender.backgroundColor!
        
    }
    

}

