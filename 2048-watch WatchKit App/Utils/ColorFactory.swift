//
//  ColorFactory.swift
//  2048-watch WatchKit Extension
//
//  Created by Furkan Kaynar on 26.11.2019.
//  Copyright © 2019 Furkan Kaynar. All rights reserved.
//

import SwiftUI

func getColor(for number: Int) -> [Color] {
    if number == 0 {
        return  [Color(#colorLiteral(red: 0.5019607843, green: 0.5568627451, blue: 0.6078431373, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]
    } else if number == 2 {
        return  [Color(#colorLiteral(red: 0.8235294118, green: 0.8549019608, blue: 0.8862745098, alpha: 1)), Color(#colorLiteral(red: 0.1176470588, green: 0.1529411765, blue: 0.1803921569, alpha: 1))]
    } else if number == 4 {
        return  [Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), Color(#colorLiteral(red: 0.1176470588, green: 0.1529411765, blue: 0.1803921569, alpha: 1))]
    } else if number == 8 {
        return  [Color(#colorLiteral(red: 1, green: 0.6588235294, blue: 0.003921568627, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]
    } else if number == 16 {
        return  [Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)), Color(#colorLiteral(red: 0.1176470588, green: 0.1529411765, blue: 0.1803921569, alpha: 1))]
    } else if number == 32 {
        return  [Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]
    } else if number == 64 {
        return  [Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]
    } else if number > 64 && number <= 2048 {
        return  [Color(#colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]
    } else {
        return  [Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))]
    }
}
