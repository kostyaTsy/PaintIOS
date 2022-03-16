//
//  Square.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 15.03.22.
//

import Foundation
import SwiftUI

class Square: Rectangle {
    override func copy(with zone: NSZone? = nil) -> Any {
        return Square(lineWidth: 5, color: .gray, figureType: .square)
    }
}

