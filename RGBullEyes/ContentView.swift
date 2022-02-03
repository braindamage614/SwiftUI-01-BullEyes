//
//  ContentView.swift
//  RGBullEyes
//
//  Created by braindamage on 2022/2/2.
//

import SwiftUI




struct ContentView: View {
    
    @State var game = Game()
    @State var guess: RGB
    @State var showScore = false

    let circleSize: CGFloat = 0.275
    let labelHeight: CGFloat = 0.06
    let labelWidth: CGFloat = 0.53
    let buttonWidth: CGFloat = 0.87

    
    var body: some View { // 1.body is a computed property
        GeometryReader { proxy in
            ZStack {
                Color.element
                    .ignoresSafeArea()
                VStack {
                    ColorCircleView(color: Color(game.target),size: proxy.size.height * circleSize)
                    if !showScore {
                      BevelText(
                        text: "R: ??? G: ??? B: ???", width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    } else {
                      BevelText(
                        text: game.target.intString(), width: 200, height: 48)
                    }
                    ColorCircleView(color: Color(guess), size: proxy.size.height * circleSize)
                    BevelText(text: guess.intString(), width: proxy.size.width * labelWidth, height: proxy.size.height * labelHeight)
                    
                    VStack {
                        ColorSlider(value: $guess.red, trackColor: .red)
                        ColorSlider(value: $guess.green, trackColor: .green)
                        ColorSlider(value: $guess.blue, trackColor: .blue)
                    }
                    .padding(.vertical)
                    Button("Hit Me!") {
                      showScore = true
                      game.check(guess: guess)
                    }
                    .buttonStyle(NeuButtonStyle(width: proxy.size.width * buttonWidth, height: proxy.size.height * labelHeight))
                    .padding(.vertical)
                    .alert(isPresented: $showScore) { //双向绑定，dismiss会置否
                      Alert(
                        title: Text("Your Score"),
                        message: Text(String(game.scoreRound)),
                        dismissButton: .default(Text("OK")) {
                          game.startNewRound()
                          guess = RGB()
                        })
                    }

                }
                .font(.headline)
            }
        }
    }
}


struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }
        .padding(.horizontal)
        .font(.subheadline)
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ContentView(guess: RGB())
                .previewDevice("iPhone 13 Pro Max")
            ContentView(guess: RGB())
                .previewDevice("iPhone 8")
        }
    }
}

struct ColorCircleView: View {
    var color: Color
    var size: Double
    var body: some View {
        ZStack {
          Circle()
            .fill(Color.element)
            .northWestShadow()
          Circle()
            .fill(color)
            .padding(20)
        }
        .frame(width: size, height: size)

    }
}
