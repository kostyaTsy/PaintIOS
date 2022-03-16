//
//  Ellipse.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 15.03.22.
//

import Foundation
import SwiftUI

class Ellipse: Rectangle {
    override func copy(with zone: NSZone? = nil) -> Any {
        return Ellipse(lineWidth: 5, color: .gray, figureType: .ellipse)
    }
}
