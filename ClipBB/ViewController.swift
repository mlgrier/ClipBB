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
    
}

