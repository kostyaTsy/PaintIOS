//
//  Line.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 13.03.22.
//

import Foundation
import SwiftUI

class Line: Figure {
    override init(lineWidth: CGFloat, color: Color) {
        super.init(lineWidth: lineWidth, color: color)
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        return Line(lineWidth: 5, color: .gray)
    }
    
    override func path() -> Path {
        var path = Path()
        
        path.addLines(coordinates)
        
        return path
    }
    
    override func addPoints(point: CGPoint) {
        coordinates.append(point)
    }
}
