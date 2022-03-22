//
//  DrawingDocument.swift
//  PaintIOS
//
//  Created by Kostya Tsyvilko on 22.03.22.
//

import Foundation

// class for saving figures on canvas to json file
class DrawingDocument {
    var figures = [Figure]()
    
    init() {
        // load the data
        if FileManager.default.fileExists(atPath: url.path),
           let data = try? Data(contentsOf: url) {
            let decoder = JSONDecoder()
            do {
                let figures = try decoder.decode([Figure].self, from: data)
                self.figures = figures
            }
            catch {
                print("Decoding error \(error)")
            }
        }
    }
    
    func save() {
        // save the data
        let encoder = JSONEncoder()
        
        let data = try? encoder.encode(figures)
        
        do {
            try data?.write(to: url)
            print(save)
        }
        catch {
            print("Encoding error \(error)")
        }
    }
    
    var url: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory.appendingPathComponent("Figures").appendingPathExtension("json")
    }
}
