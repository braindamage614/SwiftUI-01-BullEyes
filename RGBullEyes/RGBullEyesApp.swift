//
//  RGBullEyesApp.swift
//  RGBullEyes
//
//  Created by braindamage on 2022/2/2.
//

import SwiftUI

@main //1.@main 表示这个struct是App的入口
struct RGBullEyesApp: App { //2.App Protocol 管理生成main函数
    var body: some Scene {
        WindowGroup {
            ContentView(guess: RGB()) //当app运行，屏幕展示ContentView的实例
        }
    }
}
