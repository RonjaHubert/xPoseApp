//
//  Gradient.swift
//  xPose
//
//  Created by Xavier Welscher on 05.01.22.
//

import UIKit

@IBDesignable
final class Gradient: UIView {
    
    @IBInspectable var firstColor: UIColor = UIColor.clear
    @IBInspectable var secondColor: UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        
        //comment
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [firstColor.cgColor, secondColor.cgColor]
        gradient.shouldRasterize = true
        gradient.zPosition = -1
        gradient.startPoint = CGPoint(x: 0, y:0)
        gradient.endPoint = CGPoint(x: 1, y:1)
        
        layer.addSublayer(gradient)
    }

}
