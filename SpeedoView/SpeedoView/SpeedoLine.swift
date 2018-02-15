//
//  SpeedoLine.swift
//  SpeedoView
//
//  Created by dhaurylenka on 2/15/18.
//  Copyright © 2018 dg. All rights reserved.
//

import QuartzCore

class SpeedoLine {
    let layer: CAShapeLayer
    private let fullScale: Float
    init(_ frame: CGRect, color: UIColor, startAngle: Float, finishAngle: Float, width: Int) {
        self.layer = CAShapeLayer(frame, color: color, startAngle: startAngle, finishAngle: finishAngle, width: width)
        self.fullScale = finishAngle - startAngle
        self.setValue(0)
    }
    
    func setValue(_ value: Int) {
        guard value < 100 else {
            layer.strokeEnd = CGFloat(fullScale / 360); return
        }
        layer.strokeEnd = CGFloat((Float(value) * fullScale) / (100 * 360))
    }
}
