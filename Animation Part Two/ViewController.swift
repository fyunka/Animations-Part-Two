//
//  ViewController.swift
//  Animations Part Two
//
//  Created by sophia on 6/16/19.
//  Copyright © 2019 fyunka. All rights reserved.
//

import UIKit

// incl. final to any classes from which we will not inherit
final class ViewController: UIViewController {

    @IBAction private func fadeIn(_ sender: Any) {
        
        image.alpha = 0 // makes image invisible
        
        UIView.animate(withDuration: 1, animations: {
            // we need a self here bc its inside a clouse, so to get out of closure and refer to img as part of ViewController we use self
            self.image.alpha = 1
            
        })
        
    }
    
    @IBAction private func slideIn(_ sender: Any) {
        // for moving img from screen
        // CGPoint stands for CoreGraphics (x is horizontal coordinate) x: image.center.x (is current coordinate) and subtract - 500px which moves img to the left and y is a vertical coordinate
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        
        UIView.animate(withDuration: 2) {
            
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
            
            }
        
    }
    
    @IBAction private func grow(_ sender: Any) {
        // CGRect -> CoreGraphics Rectangle
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        
        UIView.animate(withDuration: 1) {
            
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            
        }
    }
    
    @IBOutlet private var button: UIButton!
    
    @IBOutlet private var image: UIImageView!
    
    var counter = 1
    
    var isAnimating = false
    
    var timer = Timer() // to start the animation we need a timer, which is an obj of class Timer()
    
    @objc func animate() {
        
        image.image = UIImage(named: "frame_\(counter)_delay-0.1s.gif")
        
        counter += 1 // increment by 1 each time
        
        if counter == 6 {
            
            counter = 0
            
        }
        
    }
    
    @IBAction private func next(_ sender: Any) {
        
        // here when the button is tapped, we want to check,if isAnimating we want to atop the animation and if it's not animating to animate it thru -> (else)
        if isAnimating {
            
            timer.invalidate()
            button.setTitle("Start Animation", for: []) // if we stop animating we need to update the btn text | an empty square brackets is a new syntax in iOS10 and simply represents an empty arr -> default state of the btn
            isAnimating = false
            
        } else {
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.animate), userInfo: nil, repeats: true)// when the button is pressed will start off the timer
            
            button.setTitle("Stop animation", for: [])
            
            isAnimating = true
            
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

