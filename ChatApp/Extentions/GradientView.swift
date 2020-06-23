//
//  GradientView.swift
//  ChatApp
//
//  Created by Инна Лаптева on 17.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import UIKit

class GradientView: UIView {
    
    private let gradientLayer = CAGradientLayer()
  
   @IBInspectable private var startColor: UIColor? {
        didSet {
          setUpGradientColor(startColor: startColor, endColor: endColor)
        }
    }
    
    @IBInspectable private var endColor: UIColor? {
        didSet {
             setUpGradientColor(startColor: startColor, endColor: endColor)
        }
    }
    
    enum Point {
        case topLeading
        case leading
        case bottomLeading
        case top
        case center
        case bottom
        case topTrailing
        case trailing
        case bottomTrailing

        var point: CGPoint {
            switch self {
            case .topLeading:
                return CGPoint(x: 0, y: 0)
            case .leading:
                return CGPoint(x: 0, y: 0.5)
            case .bottomLeading:
                return CGPoint(x: 0, y: 1.0)
            case .top:
                return CGPoint(x: 0.5, y: 0)
            case .center:
                return CGPoint(x: 0.5, y: 0.5)
            case .bottom:
                return CGPoint(x: 0.5, y: 1.0)
            case .topTrailing:
                return CGPoint(x: 1.0, y: 0.0)
            case .trailing:
                return CGPoint(x: 1.0, y: 0.5)
            case .bottomTrailing:
                return CGPoint(x: 1.0, y: 1.0)
            }
        }
    }
    
   override init(frame: CGRect) {
        super.init(frame: frame)
    }
    init(from: Point, to: Point, startColor: UIColor?, endColor: UIColor?) {
        self.init()
        setUpGradient(from: from, to: to, startColor: startColor, endColor: endColor)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpGradient(from: .bottomLeading, to: .topTrailing, startColor: startColor, endColor: endColor)
    }
    
    
    private func setUpGradient(from: Point, to: Point, startColor: UIColor?, endColor: UIColor?) {
        self.layer.addSublayer(gradientLayer)
        setUpGradientColor(startColor: startColor, endColor: endColor)
        gradientLayer.startPoint = from.point
        gradientLayer.endPoint = to.point
        
    }
    
    private func setUpGradientColor(startColor: UIColor?, endColor: UIColor?) {
        if let startColor = startColor, let endColor = endColor {
            gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
    
}
