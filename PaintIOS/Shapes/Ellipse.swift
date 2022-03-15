//
//  Ellipse.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 15.03.22.
//

import Foundation
import SwiftUI

class Ellipse: Rectangle {
    override init(lineWidth: CGFloat, color: Color) {
        super.init(lineWidth: 5, color: .gray)
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        return Ellipse(lineWidth: 5, color: .gray)
    }
    
    override func path() -> Path {
        let stPoint = coordinates[0]
        let endPoint = coordinates.last ?? CGPoint(x: 0, y: 0)
        let figFrame = CGRect(origin: stPoint, size: CGSize(width: endPoint.x - stPoint.x, height: endPoint.y - stPoint.y))
        
        var path = Path()
        
        path.addEllipse(in: figFrame)
        
        return path
    }
}
