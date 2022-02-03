//
//  ColorExtension.swift
//  RGBullEyes
//
//  Created by braindamage on 2022/2/2.
//

import Foundation

import SwiftUI

extension Color {
    
    static let element = Color("Element")
    static let highlight = Color("Highlight")
    static let shadow = Color("Shadow")
    
    /// Create a Color view from an RGB object.
    ///   - parameters:
    ///     - rgb: The RGB object.
    init(_ rgb: RGB) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
    }
}
