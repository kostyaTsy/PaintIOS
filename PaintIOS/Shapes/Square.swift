//
//  Square.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 15.03.22.
//

import Foundation
import SwiftUI

class Square: Rectangle {
    override init(lineWidth: CGFloat, color: Color) {
        super.init(lineWidth: 5, color: .gray)
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        return Square(lineWidth: 5, color: .gray)
    }
    
    override func path() -> Path {
        let stPoint = coordinates[0]
        let endPoint = coordinates.last ?? CGPoint(x: 0, y: 0)
        
        let size = min(endPoint.x - stPoint.x, endPoint.y - stPoint.y)
        let figFrame = CGRect(origin: stPoint, size: CGSize(width: size, height: size))
        
        var path = Path()
        path.addRect(figFrame)
        
        return path
    }
}

