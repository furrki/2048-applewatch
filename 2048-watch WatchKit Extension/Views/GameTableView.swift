//
//  GameTableView.swift
//  2048-watch WatchKit Extension
//
//  Created by Furkan Kaynar on 26.11.2019.
//  Copyright © 2019 Furkan Kaynar. All rights reserved.
//

import SwiftUI

struct GameTableView: View {
    var body: some View {
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
        .background(Color.blue)
        .cornerRadius(4.0)
    }
}
