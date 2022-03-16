//
//  Rectangle.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 15.03.22.
//

import Foundation
import SwiftUI

class Rectangle: Figure {
    override func copy(with zone: NSZone? = nil) -> Any {
        return Rectangle(lineWidth: 5, color: .gray, figureType: .rectangle)
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
