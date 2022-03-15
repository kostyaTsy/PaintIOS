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
        if (currentFig is Line) {
            ImageView(buttonBgColor: whiteBg, imName: "line.diagonal")
        }
        else if (currentFig is Rectangle) {
            ImageView(buttonBgColor: whiteBg, imName: "rectangle")
        }
    }
}

struct FigureTypeView_Previews: PreviewProvider {
    static var previews: some View {
        FigureTypeView(currentFig: Rectangle(lineWidth: 2, color: .gray))
    }
}
