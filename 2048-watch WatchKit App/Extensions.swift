//
//  Extensions.swift
//  2048-watch WatchKit Extension
//
//  Created by Furkan Kaynar on 26.11.2019.
//  Copyright © 2019 Furkan Kaynar. All rights reserved.
//

import SwiftUI
import UIKit

extension Array where Element: Equatable {
    func indexes(of element: Element) -> [Int] {
        return self.enumerated().filter({ element == $0.element }).map({ $0.offset })
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
    
    func transposed() -> [[Int]] {
        var transposedArray = [[Int]]()
        var array = self as! [[Int]]
        for i in stride(from: 0, to: self.count, by: 1)
        {
            var subArray = [Int]()
            for j in stride(from: 0, to: self.count, by: 1)
            {
                if array[j].count < array.count
                {
                    array[j].append(0)
                }
                subArray.append(array[j][i])
            }
            transposedArray.append(subArray)
        }
        return transposedArray
    }
}

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}

extension Color {
    init(_ uiColor: UIColor) {
        self.init(red: Double(uiColor.rgba.red),
                  green: Double(uiColor.rgba.green),
                  blue: Double(uiColor.rgba.blue),
                  opacity: Double(uiColor.rgba.alpha))
    }
}
