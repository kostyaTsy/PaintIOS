//
//  Rectangle.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 15.03.22.
//

import Foundation
import SwiftUI

class Rectangle: Figure {
    override init(lineWidth: CGFloat, color: Color) {
        super.init(lineWidth: lineWidth, color: color)
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        return Rectangle(lineWidth: 5, color: .gray)
    }
    
    override func path() -> Path {
        let stPoint = coordinates[0]
        //let endPoint = coordinates[coordinates.count - 1]
        let endPoint = coordinates.last!  // ?? CGPoint(x: 0, y: 0)
        let figFrame = CGRect(origin: stPoint, size: CGSize(width: endPoint.x - stPoint.x, height: endPoint.y - stPoint.y))
        
        var path = Path()
        path.addRect(figFrame)
        
        return path
    }
    
    override func addPoints(point: CGPoint) {
        if coordinates.count < 2 {
            coordinates.append(point)
        } else if coordinates.count == 2 {
            coordinates.removeLast()
            coordinates.append(point)
        }
    }
}
