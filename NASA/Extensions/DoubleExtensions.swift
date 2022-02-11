//
//  DoubleExtensions.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/10/22.
//

import Foundation

extension Double {
    func removeZerosFromEnd() -> String {
        let formatter = NumberFormatter()
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 16
        return String(formatter.string(from: number) ?? "error")
    }
}
