//
//  ContentView.swift
//  2048-watch WatchKit Extension
//
//  Created by Furkan Kaynar on 26.11.2019.
//  Copyright © 2019 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var game: Game
    @ObservedObject var gameViewModel: GameViewModel
    
    @State private var offset: CGSize = .zero
    
    init() {
        self.game = Game()
        self.gameViewModel = GameViewModel(game: Game())
        
        self.gameViewModel.game = self.game
    }
    
    var body: some View {
        VStack {
                VStack(alignment: .center, spacing: 0) {
                    ForEach(0..<4) { i in
                        HStack(alignment: .center, spacing: 0) {
                            ForEach(0..<4) { j in
                                NumberCellView(number: self.gameViewModel.getNumber(i, j),
                                               textColor: self.gameViewModel.getForegroundColor(i, j),
                                               backgroundColor: self.gameViewModel.getBackgroundColor(i, j))
                            }.padding(2)
                        }
                    }
                }
                .background(Color.black)
                .cornerRadius(4.0)
                .gesture(DragGesture().onEnded({ (val) in
                    self.gameViewModel.doMove(translation: val.translation)
                }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NumberCellView: View {
    var number: String
    var textColor: Color
    var backgroundColor: Color
    
    init(number: String, textColor: Color, backgroundColor: Color) {
        self.number = number
        self.backgroundColor = backgroundColor
        self.textColor = textColor
    }
    
    var body: some View {
        Text(self.number)
            .fixedSize()
            .frame(width: 30, height: 30, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .cornerRadius(4.0)
    }
}
