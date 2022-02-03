//
//  RGB.swift
//  RGBullEyes
//
//  Created by braindamage on 2022/2/2.
//

import Foundation

struct RGB {
    var red = 0.5
    var green = 0.5
    var blue = 0.5
    
    /// Create an RGB object with random values.
    static func random() -> RGB {
        var random = RGB()
        random.red = .random(in: 0...1)
        random.green = .random(in: 0...1)
        random.blue = .random(in: 0...1)
        return random
    }
    
    /// Compute the normalized 3-dimensional distance to another RGB object.
    ///   - parameters:
    ///     - target: The other RGB object.
    func difference(_ target: RGB) -> Double {
        let rX = red - target.red
        let gX = green - target.green
        let bX = blue - target.blue
        return sqrt( rX * rX + gX * gX + bX * bX )
    }
    
    /// Create a String representing the integer values of an RGB object.
    func intString() -> String {
      "R: \(Int(red * 255.0))"
        + "  G: \(Int(green * 255.0))"
        + "  B: \(Int(blue * 255.0))"
    }
}
