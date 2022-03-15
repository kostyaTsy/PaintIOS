//
//  ImageView.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 12.03.22.
//

import SwiftUI

struct ImageView: View {
    var buttonBgColor: Color
    var imName: String
    
    var body: some View {
        Image(systemName: imName)
            .resizable()
            .scaledToFit()
            .padding(10)
            .frame(width: 50, height: 50)
            .foregroundColor(.black)
            //.background(Color(buttonBgColor))
            .background(buttonBgColor)
            .cornerRadius(50)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(buttonBgColor: Color(.sRGB, red: 0.839216, green: 0.839216, blue: 0.839216, opacity: 1), imName: "square")
    }
}
