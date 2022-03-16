//
//  Line.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 13.03.22.
//

import Foundation
import SwiftUI

class Line: Figure { 
    override func copy(with zone: NSZone? = nil) -> Any {
        return Line(lineWidth: 5, color: .gray, figureType: .line)
    }
    
    override func addPoints(point: CGPoint) {
        coordinates.append(point)
    }
}
