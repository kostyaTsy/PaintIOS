//
//  FigureTypeView.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 15.03.22.
//

import SwiftUI

struct FigureTypeView: View {
    var whiteBg: Color = Color(.white)
    
    var currentFig: Figure
    var body: some View {
        
        switch currentFig {
        case _ as Square:
            ImageView(buttonBgColor: whiteBg, imName: "square")
        case _ as Triangle:
            ImageView(buttonBgColor: whiteBg, imName: "triangle")
        case _ as Circle:
            ImageView(buttonBgColor: whiteBg, imName: "circle")
        case _ as Ellipse:
            ImageView(buttonBgColor: whiteBg, imName: "oval")
        case _ as Line:
            ImageView(buttonBgColor: whiteBg, imName: "line.diagonal")
        case _ as Rectangle:
            ImageView(buttonBgColor: whiteBg, imName: "rectangle")
        default:
            ImageView(buttonBgColor: whiteBg, imName: "trash")
        }
    }
}

struct FigureTypeView_Previews: PreviewProvider {
    static var previews: some View {
        FigureTypeView(currentFig: Rectangle(lineWidth: 2, color: .gray, figureType: .rectangle))
    }
}
