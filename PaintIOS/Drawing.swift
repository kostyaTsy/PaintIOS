//
//  Drawing.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 16.03.22.
//

import Foundation
import SwiftUI

class Drawing {
    var figure: Figure
    
    init(figure: Figure) {
        self.figure = figure
    }
    
    // Method of drawing a figuare
    func Draw() -> Path {
        // Dictionary to find the drawing method
        let DictTypes: [FigureType: Path] = [.line: drawLine(figure: figure),
                                             .rectangle: drawRect(figure: figure),
                                             .square: drawSquare(figure: figure),
                                             .triangle: drawTriangle(figure: figure),
                                             .ellipse: drawEllipse(figure: figure),
                                             .circle: drawCircle(figure: figure)]
        
        let path = DictTypes[figure.figureType]
        
        return path!
    }
    
    private func drawLine(figure: Figure) -> Path {
        var path = Path()
        
        path.addLines(figure.coordinates)
        
        return path
    }
    
    private func drawRect(figure: Figure) -> Path {
        let stPoint = figure.coordinates[0]
        let endPoint = figure.coordinates.last ?? CGPoint(x: 0, y: 0)
        let figFrame = CGRect(origin: stPoint, size: CGSize(width: endPoint.x - stPoint.x, height: endPoint.y - stPoint.y))
        
        var path = Path()
        path.addRect(figFrame)
        
        return path
    }
    
    private func drawSquare(figure: Figure) -> Path {
        let stPoint = figure.coordinates[0]
        let endPoint = figure.coordinates.last ?? CGPoint(x: 0, y: 0)
        
        let size = min(endPoint.x - stPoint.x, endPoint.y - stPoint.y)
        
        let figFrame = CGRect(origin: stPoint, size: CGSize(width: size, height: size))
        
        var path = Path()
        path.addRect(figFrame)
        
        return path
        
    }
    
    private func drawTriangle(figure: Figure) -> Path {
        let stPoint = figure.coordinates[0]
        let endPoint = figure.coordinates.last ?? CGPoint(x: 0, y: 0)
        let figFrame = CGRect(origin: stPoint, size: CGSize(width: endPoint.x - stPoint.x, height: endPoint.y - stPoint.y))
        
        var path = Path()
        
        path.move(to: CGPoint(x: figFrame.midX, y: figFrame.minY))
        path.addLine(to: CGPoint(x: figFrame.minX, y: figFrame.maxY))
        path.addLine(to: CGPoint(x: figFrame.maxX, y: figFrame.maxY))
        path.addLine(to: CGPoint(x: figFrame.midX, y: figFrame.minY))
        
        return path
    }
    
    private func drawEllipse(figure: Figure) -> Path {
        let stPoint = figure.coordinates[0]
        let endPoint = figure.coordinates.last ?? CGPoint(x: 0, y: 0)
        let figFrame = CGRect(origin: stPoint, size: CGSize(width: endPoint.x - stPoint.x, height: endPoint.y - stPoint.y))
        
        var path = Path()
        
        path.addEllipse(in: figFrame)
        
        return path
    }
    
    private func drawCircle(figure: Figure) -> Path {
        let stPoint = figure.coordinates[0]
        let endPoint = figure.coordinates.last ?? CGPoint(x: 0, y: 0)
        
        let size = min(endPoint.x - stPoint.x, endPoint.y - stPoint.y)
        let figFrame = CGRect(origin: stPoint, size: CGSize(width: size, height: size))
        
        var path = Path()
        path.addEllipse(in: figFrame)
        
        return path
    }
    
}
