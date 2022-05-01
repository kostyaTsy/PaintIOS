//
//  ContentView.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 12.03.22.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedLineWidth: CGFloat = 4
    @State private var selectedColor: Color = Color(.sRGB, red: 0.5, green: 0.5, blue: 0.5, opacity: 1)
    var buttonBgColor: Color = Color(.sRGB, red: 0.921569, green: 0.921569, blue: 0.921569, opacity: 1)
    
    
    @State var isFigChanged: Bool = false
    
    @State var currentFig: Figure = Line(lineWidth: 2, color: Color(.gray), figureType: .line)
    
    var drawingDocument = DrawingDocument()
    
    var body: some View {
        ZStack {
            HStack(alignment: .center) {
                VStack(alignment: .leading, spacing: 20) {
                    // Line button
                    Button {
                        currentFig = Line(lineWidth: selectedLineWidth, color: selectedColor, figureType: .line)
                        print(currentFig.color)
                        
                    } label: {
                        ImageView(buttonBgColor: buttonBgColor, imName: "line.diagonal")
                    }
                    
                    // Rectangle button
                    Button {
                        currentFig = Rectangle(lineWidth: selectedLineWidth, color: selectedColor, figureType: .rectangle)
                    } label: {
                        ImageView(buttonBgColor: buttonBgColor, imName: "rectangle")
                    }
                    
                    // Square button
                    Button {
                        currentFig = Square(lineWidth: selectedLineWidth, color: selectedColor, figureType: .square)
                    } label: {
                        ImageView(buttonBgColor: buttonBgColor, imName: "square")
                    }
                    
                    // Triangle button
                    Button {
                        currentFig = Triangle(lineWidth: selectedLineWidth, color: selectedColor, figureType: .triangle)
                    } label: {
                        ImageView(buttonBgColor: buttonBgColor, imName: "triangle")
                    }
                    
                    // Ellipse button
                    Button {
                        currentFig = Ellipse(lineWidth: selectedLineWidth, color: selectedColor, figureType: .ellipse)
                    } label: {
                        ImageView(buttonBgColor: buttonBgColor, imName: "oval")
                    }
                    
                    // Circle button
                    Button {
                        currentFig = Circle(lineWidth: selectedLineWidth, color: selectedColor, figureType: .circle)
                    } label: {
                        ImageView(buttonBgColor: buttonBgColor, imName: "circle")
                    }

                    
                    ColorPicker("", selection: $selectedColor)
                        .frame(width: 50, height: 50)
                        .scaleEffect(CGSize(width: 1.5, height: 1.5))
                        .labelsHidden()
                    
                    // Clearing the canvas
                    Button {
                        drawingDocument.figures = [Figure]()
                        isFigChanged.toggle()
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
                        for figure in drawingDocument.figures {
                            //let path = figure.path()
                            let drawing = Drawing(figure: figure)
                            let path = drawing.Draw()
                            
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
                            // Copying instance of a Figure class
                            currentFig = currentFig.copy() as! Figure
                            
                            currentFig.color = selectedColor
                            currentFig.lineWidth = selectedLineWidth
                            currentFig.addPoints(point: newPoint)
                            
                            drawingDocument.figures.append(currentFig)
                            print(drawingDocument.figures)
                        } else {
                            let index = drawingDocument.figures.count - 1
                            drawingDocument.figures[index].addPoints(point: newPoint)
                        }
                        isFigChanged.toggle()
                    })
                    // Saving figures
                    .onEnded({ Value in
                        drawingDocument.save()
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
