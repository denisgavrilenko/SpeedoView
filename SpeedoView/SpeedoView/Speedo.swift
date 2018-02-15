//
//  Speedo.swift
//  SpeedoView
//
//  Created by dhaurylenka on 2/15/18.
//  Copyright © 2018 dg. All rights reserved.
//

import UIKit

@IBDesignable
public class Speedo: UIView {
    private var backgroundLayer: CALayer = CALayer()
    private var gradientLayer: CALayer = CALayer()
    private var speedoLine: SpeedoLine!
    private var lastFrame = CGRect.zero
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        guard lastFrame != self.frame else { return }
        
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        backgroundLayer = CAShapeLayer(bounds, color: .gray, startAngle: 30, finishAngle: 330, width: 10)
        gradientLayer = CALayer(bounds, gradientColors: [.purple, .blue, .green, .purple])
        speedoLine = SpeedoLine(bounds, color: .gray, startAngle: 30, finishAngle: 330, width: 10)
        gradientLayer.withMask(speedoLine.layer)
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(gradientLayer)
    }
    
    public func setValue(_ value: Int) {
        speedoLine.setValue(value)
    }
}
