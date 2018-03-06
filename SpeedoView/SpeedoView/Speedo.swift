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
    
    public override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        setValue(100)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        guard lastFrame != self.frame else { return }
        layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        backgroundLayer = CAShapeLayer(bounds, color: .gray, startAngle: 30, finishAngle: 330, width: 10)
        gradientLayer = CALayer(bounds, gradientColors: [#colorLiteral(red: 0.009523575194, green: 0.8102305532, blue: 0.4242953062, alpha: 1), #colorLiteral(red: 0.009523575194, green: 0.8102305532, blue: 0.4242953062, alpha: 1), #colorLiteral(red: 0.810185492, green: 0.9170953631, blue: 0.1986451447, alpha: 1), #colorLiteral(red: 0.428086102, green: 0.7447001338, blue: 0.5761241317, alpha: 1), #colorLiteral(red: 0.002692978596, green: 0.5805307627, blue: 0.9376723766, alpha: 1), #colorLiteral(red: 0.002692978596, green: 0.5805307627, blue: 0.9376723766, alpha: 1), #colorLiteral(red: 0.009523575194, green: 0.8102305532, blue: 0.4242953062, alpha: 1)])
        speedoLine = SpeedoLine(bounds, color: .gray, startAngle: 30, finishAngle: 330, width: 10)
        gradientLayer.withMask(speedoLine.layer)
        layer.addSublayer(backgroundLayer)
        layer.addSublayer(gradientLayer)
    }
    
    public func setValue(_ value: Int) {
        speedoLine.setValue(value)
    }
}
