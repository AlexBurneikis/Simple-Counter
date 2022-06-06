//
//  ContentView.swift
//  Simple Counter
//
//  Created by Alexander Burneikis on 6/6/2022.
//

import SwiftUI
let screenSize: CGRect = UIScreen.main.bounds
let screenWidth = screenSize.width
let screenHeight = screenSize.height

let light = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
let dark = UIColor(red:0, green: 0, blue: 0, alpha: 1)

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var counter = 0
    
    func makeCounter() -> Text{
        return Text(String(self.counter))
            .foregroundColor(Color(colorScheme == .dark ? light : dark))
            .font(Font.system(size:80))
    }
    func makeLeftHalf() -> some View {
        return Color(colorScheme == .dark ? dark : light)
            .onTapGesture {
                self.counter -= 1
            }
        .frame(width: screenWidth * 0.5, height: screenHeight * 0.7)
    }
    func makeRightHalf() -> some View {
        return Color(colorScheme == .dark ? dark : light)
            .onTapGesture {
                self.counter += 1
            }
            .frame(width: screenWidth * 0.5, height: screenHeight * 0.7)
    }
    func makeBottomHalf() -> some View {
        return Color(colorScheme == .dark ? dark : light)
            .onTapGesture {
                self.counter = 0
            }
        .frame(width: screenWidth, height: screenHeight * 0.3)
    }
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                makeLeftHalf()
                makeRightHalf()
            }
                makeBottomHalf()
            }
            makeCounter()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
