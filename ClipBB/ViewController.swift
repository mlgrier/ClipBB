//
//  ViewController.swift
//  ClipBB
//
//  Created by Marco Grier on 1/19/19.
//  Copyright © 2019 Hoodde LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var clearButton: UIButton!
    
    
    @IBOutlet weak var colorButton0: UIButton!
    @IBOutlet weak var colorButton1: UIButton!
    @IBOutlet weak var colorButton2: UIButton!
    @IBOutlet weak var colorButton3: UIButton!
    @IBOutlet weak var colorButton4: UIButton!
    
    
    var path = UIBezierPath()
    var startPoint = CGPoint()
    var touchPoint = CGPoint()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
    }
    
    func setup() {
        clearButton.layer.cornerRadius = 20
        mainImage.clipsToBounds = true
        mainImage.isMultipleTouchEnabled = false
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: mainImage) {
            startPoint = point
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: mainImage) {
            touchPoint = point
        }
        path.move(to: startPoint)
        path.addLine(to: touchPoint)
        startPoint = touchPoint
        
        draw()
    }
    
    func draw() {
        let strokeLayer = CAShapeLayer()
        strokeLayer.fillColor = nil
        strokeLayer.lineWidth = 5
        strokeLayer.strokeColor = UIColor.black.cgColor
        strokeLayer.path = path.cgPath
        mainImage.layer.addSublayer(strokeLayer)
        mainImage.setNeedsDisplay()
    }

    @IBAction func clearAction(_ sender: Any) {
        path.removeAllPoints()
        mainImage.layer.sublayers = nil
        mainImage.setNeedsDisplay()
    }
    @IBAction func colorPick(_ sender: Any) {
    }
    
    func textSwap(sender: UIButton) {
        switch (sender as AnyObject).tag {
        case 0:
            labelNumber1.text = event2
        case 1:
            labelNumber2.text = event1
        case 2:
            labelNumber2.text = event3
        case 3:
            labelNumber2.text = event3
        case 4:
            labelNumber3.text = event4
        default:
            print("error")
        }
    }

    
}

