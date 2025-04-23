//
//  ContentView.swift
//  FindFiveMisses
//
//  Created by Jeanette Norberg on 2025-04-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = FiveViewModel()
    @State private var träffadPosition: CGPoint? = nil
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack {
                    Text("Find Five Misstakes!")
                    Image("bild")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 390, height: 300)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onEnded { value in
                                    let location = value.location
                                    if viewModel.checkPress(point: location) {
                                        träffadPosition = location
                                        print("Rätt tryck!")
                                        
                                    } else {
                                        print("Fel tryck!")
                                    }
                                }
                        )
                    if let position = träffadPosition {
                          Image(systemName: "xmark.circle.fill")
                              .resizable()
                              .frame(width: 40, height: 40)
                              .foregroundColor(.red)
                              .position(position)
                              .transition(.scale)
                      }}
                }
                
                   }
               }
}

/*#Preview {
    ContentView()
}*/
