//
//  Fiqure.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 12.03.22.
//

import Foundation
import SwiftUI

class Figure: ObservableObject, NSCopying {
    @Published var coordinates: [CGPoint] = [CGPoint]()
    
    var lineWidth: CGFloat = 5
    var color: Color
    
    // Initialiser of class
    init(lineWidth: CGFloat, color: Color) {
        self.lineWidth = lineWidth
        self.color = color
    }
    
    // Copying of instance function
    func copy(with zone: NSZone? = nil) -> Any {
        return Figure(lineWidth: 5, color: .gray)
    }
    
    
    // Drawing figure function
    func path() -> Path {
        return Path()
    }
    
    // Adding point to coordinates array
    func addPoints(point: CGPoint) {
        
    }
}
