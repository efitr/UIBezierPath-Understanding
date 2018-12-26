//
//  DemoView.swift
//  UIBezierPath
//
//  Created by Egon Fiedler on 12/21/18.
//  Copyright © 2018 App Solutions. All rights reserved.
//

import UIKit

class DemoView: UIView {

    
    var path: UIBezierPath!
    
// Comes with a price in performance
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//        //self.createRectangle()
//        //self.createTriangle()
//
////        self.path = UIBezierPath(ovalIn: self.bounds)
//
////        self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2,
////                                                y: 0.0,
////                                                width: self.frame.size.height,
////                                                height: self.frame.size.height))
//
////        path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15.0)
//
////        path = UIBezierPath(roundedRect: self.bounds,
////                            byRoundingCorners: [.topLeft, .bottomRight],
////                            cornerRadii: CGSize(width: 15.0, height: 0.0))
////
//
////        path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2),
////                            radius: self.frame.size.height/2,
////                            startAngle: CGFloat(80.0).toRadians(),
////                            endAngle: CGFloat(180.0).toRadians(),
////                            clockwise: true)
//
//        path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2),
//                            radius: self.frame.size.height/2,
//                            startAngle: CGFloat(240.0).toRadians(),
//                            endAngle: CGFloat(15.0).toRadians(),
//                            clockwise: false)
//
//        // Specify the fill color and apply it to the path.
//        UIColor.orange.setFill()
//        path.fill()
//
//        // Specify a border (stroke) color.
//        UIColor.purple.setStroke()
//        path.stroke()
//    }
    
    
    func maskVsSublayer() {
        self.createTriangle()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        
        self.layer.addSublayer(shapeLayer)
    }

    
    func simpleShapeLayer() {
        self.createRectangle()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = self.path.cgPath
        
        shapeLayer.fillColor = UIColor.yellow.cgColor
        shapeLayer.strokeColor = UIColor.brown.cgColor
        shapeLayer.lineWidth = 3.0
        
        self.layer.addSublayer(shapeLayer)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
        
        maskVsSublayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createRectangle() {
        path = UIBezierPath()
        
        // Specify the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        // Create a line between the starting point and the bottom-left side of the view.
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        
        // Create the bottom line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        // Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        
        // Close the path. This will create the last line automatically.
        path.close()
    }
    
    func createTriangle() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }

}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}
