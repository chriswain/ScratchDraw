//
//  ViewController.swift
//  ScratchDraw
//
//  Created by Christopher Wainwright Aaron on 5/14/15.
//  Copyright (c) 2015 Chris Aaron. All rights reserved.
//

import UIKit

var fillColors: [UIColor] = [
    UIColor.blackColor(),
    UIColor.magentaColor(),
    UIColor.cyanColor(),
    UIColor.yellowColor(),
    UIColor.redColor(),
    UIColor.blueColor(),
    UIColor.purpleColor()
]

var strokeColors: [UIColor] = [
    UIColor.blackColor(),
    UIColor.magentaColor(),
    UIColor.cyanColor(),
    UIColor.yellowColor()
]

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var viewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var fillColorCollectionView: UICollectionView!
    
    
    @IBAction func clearLines(sender: AnyObject) {
        scratchPad.scratches = []
        scratchPad.setNeedsDisplay()
    }
    
    @IBOutlet weak var scratchPad: ScratchView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillColorCollectionView.dataSource = self
        fillColorCollectionView.delegate = self
        
        viewBottomConstraint.constant = -300
  
        
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fillColors.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("colorCell", forIndexPath: indexPath) as! ColorCell
        
        cell.backgroundColor = fillColors[indexPath.item]
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! ColorCell
        
        if let color = cell.backgroundColor {
            scratchPad.currentColor = color 
        }
        
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
        
        
        
        
    }
    
    @IBAction func showHide(sender: AnyObject) {
        
        viewBottomConstraint.constant = (viewBottomConstraint.constant == 0) ? -300 : 0
        
        UIView.animateWithDuration(0.4, animations: { () -> Void in
        
        })
    
    }

}

