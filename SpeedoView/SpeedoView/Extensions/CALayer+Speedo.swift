//
//  CALayer+Speedo.swift
//  SpeedoView
//
//  Created by dhaurylenka on 2/15/18.
//  Copyright © 2018 dg. All rights reserved.
//

import Foundation

extension BinaryInteger {
    var degreesToRadians: CGFloat { return CGFloat(Int(self)) * .pi / 180 }
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}

extension CAShapeLayer {
    convenience init(_ frame: CGRect, color: UIColor, startAngle: Float, finishAngle: Float, width: Int) {
        self.init()
        self.frame = frame
        self.path = UIBezierPath(roundedRect: CGRect(x: CGFloat(width),
                                                     y: CGFloat(width),
                                                     width: frame.width - 2.0 * CGFloat(width),
                                                     height: frame.height - 2.0 * CGFloat(width)),
                                 cornerRadius: frame.width / 2 - CGFloat(width)).cgPath
        self.strokeColor = color.cgColor
        self.fillColor = UIColor.clear.cgColor
        self.lineWidth = CGFloat(width)
        self.transform = CATransform3DRotate(self.transform, CGFloat((Float(180) + startAngle).degreesToRadians), 0, 0, 1)
        self.strokeStart = 0.0
        self.strokeEnd = CGFloat((finishAngle - startAngle) / 360.0)
        self.lineCap = kCALineCapRound
    }
}

extension CALayer {
    convenience init(_ frame: CGRect, gradientColors: [UIColor]) {
        self.init()
        self.frame = frame
        self.contents = MKGradientGenerator.gradientImage(type: .conical, size: bounds.size, colors: gradientColors.map { $0.cgColor })
        self.position = CGPoint(x: bounds.midX, y: bounds.midY)
    }
    
    func withMask(_ mask: CALayer) {
        self.mask = mask
    }
}
