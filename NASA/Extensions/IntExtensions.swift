//
//  IntExtensions.swift
//  NASA
//
//  Created by Benjamin Kelsey on 2/10/22.
//

import Foundation

extension Int {
    
    // No easy way in Swift to subscript characters
    // Need this for exponents since we are dealing with huge numbers
    var superscriptString: String {
        var input: Int = self
        var result: String = ""
        
        while input > 0 {
            let lastDigit = input % 10
            input /= 10
            guard let superscript = lastDigit.superscript else { continue }
            result = superscript + result
        }
        
        return result
    }
    
    private var superscript: String? {
        switch self {
        case 0:
            return "\u{2070}"
        case 1:
            return "\u{00B9}"
        case 2:
            return "\u{00B2}"
        case 3:
            return "\u{00B3}"
        case 4:
            return "\u{2074}"
        case 5:
            return "\u{2075}"
        case 6:
            return "\u{2076}"
        case 7:
            return "\u{2077}"
        case 8:
            return "\u{2078}"
        case 9:
            return "\u{2079}"
        default:
            return nil
        }
    }
    
}
