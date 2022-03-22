//
//  Fiqure.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 12.03.22.
//

import Foundation
import SwiftUI

// Adding codable protocol to save data
// TODO: fix the color (make first color from selected color)
class Figure: NSCopying, Codable {
    var coordinates: [CGPoint] = [CGPoint]()
    
    var lineWidth: CGFloat = 5
    var color: Color {
        get {
            customColor.color
        }
        set {
            customColor = CustomColor(color: newValue)
        }
    }
    
    var customColor: CustomColor
    
    var figureType: FigureType
    
    
    // Initialiser of class
    init(lineWidth: CGFloat, color: Color, figureType: FigureType) {
        self.lineWidth = lineWidth
        //self.color = color
        self.customColor = CustomColor(color: color)
        self.figureType = figureType
    }
    
    // Copying of instance function
    func copy(with zone: NSZone? = nil) -> Any {
        return Figure(lineWidth: 5, color: .gray, figureType: .none)
    }
    
    // Adding point to coordinates array
    func addPoints(point: CGPoint) {
        
    }
}


// CustomColor to make color codable
struct CustomColor: Codable {
    var green: Double = 0
    var blue: Double = 0
    var red: Double = 0
    var opacity: Double = 1
    
    init(color: Color) {
        if let colorComponents = color.cgColor?.components {
            // Getting red, green, blue color values
            if colorComponents.count > 2 {
                red = colorComponents[0]
                green = colorComponents[1]
                blue = colorComponents[2]
            }
            
            // Getting opacity color value
            if colorComponents.count > 3 {
                opacity = colorComponents[3]
            }
        }
    }
    
    var color: Color {
        Color(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
