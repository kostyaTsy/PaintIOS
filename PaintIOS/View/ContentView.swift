//
//  ContentView.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 12.03.22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedLineWidth: CGFloat = 4
    @State private var selectedColor: Color = Color(.gray)  //Color(.systemBackground)
    var buttonBgColor: Color = Color(.sRGB, red: 0.921569, green: 0.921569, blue: 0.921569, opacity: 1)
    
    
    @State var isFigChanged: Bool = false
    
    @State var currentFig: Figure = Line(lineWidth: 2, color: Color(.gray))
    @State var figures = [Figure]()
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    // Line button
                    Button {
                        print(selectedColor)
                        currentFig = Line(lineWidth: selectedLineWidth, color: selectedColor)
                    } label: {
                        ImageView(buttonBgColor: buttonBgColor, imName: "line.diagonal")
                    }
                    
                    // Rectangle button
                    Button {
                        print(selectedColor)
                        currentFig = Rectangle(lineWidth: selectedLineWidth, color: selectedColor)
                    } label: {
                        ImageView(buttonBgColor: buttonBgColor, imName: "rectangle")
                    }
                    
                    // Square button
                    Button {
                        currentFig = Square(lineWidth: selectedLineWidth, color: selectedColor)
                    } label: {
                        ImageView(buttonBgColor: buttonBgColor, imName: "square")
                    }
                    
                    // Triangle button
                    Button {
                        currentFig = Triangle(lineWidth: selectedLineWidth, color: selectedColor)
                    } label: {
                        ImageView(buttonBgColor: buttonBgColor, imName: "triangle")
                    }
                    
                    // Ellipse button
                    Button {
                        currentFig = Ellipse(lineWidth: selectedLineWidth, color: selectedColor)
                    } label: {
                        ImageView(buttonBgColor: buttonBgColor, imName: "oval")
                    }
                    
                    // Circle button
                    Button {
                        currentFig = Circle(lineWidth: selectedLineWidth, color: selectedColor)
                    } label: {
                        ImageView(buttonBgColor: buttonBgColor, imName: "circle")
                    }

                    
                    ColorPicker("", selection: $selectedColor)
                        .frame(width: 50, height: 50)
                        .scaleEffect(CGSize(width: 1.5, height: 1.5))
                        .labelsHidden()
                    
                    // TODO: make deleting of all coordinates array of figures
                    Button {
                        figures = [Figure]()
                    } label: {
                        ImageView(buttonBgColor: Color(.white), imName: "trash")
                    }

                }
                .padding()
                
                VStack{
                    HStack{
                        FigureTypeView(currentFig: currentFig)
                        Slider(value: $selectedLineWidth, in: 1...10) {
                            Text("Line")
                        }
                        .frame(maxWidth: 300)
                    
                        Text(String(format: "%0.1f", selectedLineWidth))
                    }
                    
                    Canvas { context, size in
                        // Drawing figures
                        // TODO: change to drawing shapes
                        for figure in figures {
                            let path = figure.path()
                            
                            context.stroke(path, with: .color(figure.color), lineWidth: figure.lineWidth)
                            
                        }
                        
                    }
                    // Using to redraw canvas
                    .onChange(of: isFigChanged, perform: { newValue in
                        isFigChanged.toggle()
                    })
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                        let newPoint = value.location
                        
                        // Checking if starting of drawing (first point of figure)
                        if (value.translation.width + value.translation.height == 0) {
                            print(type(of: currentFig))
                            // Copying instance of a Figure class
                            currentFig = currentFig.copy() as! Figure
                            
                            currentFig.color = selectedColor
                            currentFig.lineWidth = selectedLineWidth
                            currentFig.addPoints(point: newPoint)
                            
                            figures.append(currentFig)
                            print(figures)
                        } else {
                            let index = figures.count - 1
                            figures[index].addPoints(point: newPoint)
                        }
                        isFigChanged.toggle()
                    }).onEnded({ value in
                        
                    })
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
