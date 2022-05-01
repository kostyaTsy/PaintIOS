//
//  Triangle.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 15.03.22.
//

import Foundation
import SwiftUI

class Triangle: Rectangle {
    override func copy(with zone: NSZone? = nil) -> Any {
        return Triangle(lineWidth: 5, color: .gray, figureType: .triangle)
    }
}
