//
//  NeuButtonStyle.swift
//  RGBullEyes
//
//  Created by braindamage on 2022/2/3.
//

import SwiftUI

struct NeuButtonStyle: ButtonStyle {
    let width: CGFloat
    let height: CGFloat
    
    func makeBody(configuration: Self.Configuration)
    -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.2 : 1)
            .foregroundColor(Color(UIColor.systemBlue))
            .frame(width: width, height: height)
            .background(
                Group {
                  if configuration.isPressed {
                    Capsule()
                      .fill(Color.element)
                      .southEastShadow()   // Add this line
                  } else {
                    Capsule()
                      .fill(Color.element)
                      .northWestShadow()
                  }
                }
            )
    }
}

