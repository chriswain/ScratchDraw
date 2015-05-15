//
//  ScratchView.swift
//  ScratchDraw
//
//  Created by Christopher Wainwright Aaron on 5/14/15.
//  Copyright (c) 2015 Chris Aaron. All rights reserved.
//

import UIKit

class ScratchView: UIView {
    
    var currentColor = UIColor.blackColor()
    
    var strokeSize: Double = 5
    
    var fillColor = UIColor.blueColor()

    var scratches: [Scratch] = []
        override func drawRect(rect: CGRect) {
            
            
            
     //       CGContextSetLineWidth(context, 5.0)
            CGContextSetLineCap(context, kCGLineCapRound)
            
      //      UIColor.blackColor().set()
            
            
            for scratch in scratches {
                
                if let firstPoint = scratch.points.first {
                    
                    if let strokeColor = scratch.strokeColor {
                        CGContextSetFillColorWithColor(context, fillColor.CGColor)

                        strokeColor.set()
                        
                        CGContextMoveToPoint(context, firstPoint.x, firstPoint.y)
                        
                        for point in scratch.points {
                            
                            CGContextAddLineToPoint(context, point.x, point.y)
                           CGContextSetLineWidth(context, CGFloat(strokeSize))
                            
                        }
                        
                        CGContextStrokePath(context)
                        
                        
                    }
               
            }
        }
    }
    
    func newScratchWithStartPoint(point: CGPoint) {
        
        
        var scratch = Scratch()
        scratch.points = [point,point]
        scratch.strokeColor = currentColor
        scratch.strokeSize = sliderValue
        scratches.append(scratch)
        setNeedsDisplay()
        
    }
    
    func updateCurrentScratchWithLastPoint(point: CGPoint) {
        
        if scratches.last != nil {
            
            scratches[scratches.count - 1].points[1] = point
            setNeedsDisplay()
        }
        
    }
    
    func addPointToCurrentScratch(point: CGPoint) {
        
        if scratches.last != nil {
            
            scratches[scratches.count - 1].points.append(point)
            setNeedsDisplay()
        }


    }
}

class Scratch {
    var points:[CGPoint] = []
    var fillColor: UIColor?
    var strokeColor: UIColor?
    var strokeSize: Double? = 0
    
    // line dash
    // line cap
    // line join
}

