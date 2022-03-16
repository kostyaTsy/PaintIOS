//
//  Circle.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 15.03.22.
//

import Foundation
import SwiftUI

class Circle: Ellipse {
    override func copy(with zone: NSZone? = nil) -> Any {
        return Circle(lineWidth: 5, color: .gray, figureType: .circle)
    }
}
