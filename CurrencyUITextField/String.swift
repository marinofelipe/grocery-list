//
//  String.swift
//  GroceryList
//
//  Created by Felipe Lefèvre Marino on 4/3/18.
//  Copyright © 2018 Felipe Lefèvre Marino. All rights reserved.
//

import UIKit

//String Currency Extension
extension String {
    
    //moves separator one character to the right. Keeps currency formated
    mutating func moveDecimalSeparator() {
        if let separatorIndex = index(of: ".") {
            
            if (endIndex.encodedOffset - separatorIndex.encodedOffset) >= 3 {
                
                let newInteger = self[index(separatorIndex, offsetBy: 1)..<index(separatorIndex, offsetBy: 2)]
                
                replaceSubrange(separatorIndex..<index(separatorIndex, offsetBy: 1), with: newInteger)
                replaceSubrange(index(separatorIndex, offsetBy: 1)..<index(separatorIndex, offsetBy: 2), with: ".")
            } else {
                let newDecimal = self[index(separatorIndex, offsetBy: -1)..<separatorIndex]
                
                replaceSubrange(separatorIndex..<index(separatorIndex, offsetBy: 1), with: newDecimal)
                replaceSubrange(index(separatorIndex, offsetBy: -1)..<separatorIndex, with: ".")
                
                self = replacingOccurrences(of: ",", with: "")
            }
        }
    }
    
    //when more values are entered and the currency number should not grow
    mutating func removeLastAndFormat() {
        let currencySymbol = Locale.current.currencySymbol
        self = replacingOccurrences(of: currencySymbol ?? "", with: "")
        
        replaceSubrange(index(startIndex, offsetBy: 1)..<index(startIndex, offsetBy: 2), with: "")
        removeLast()
        replaceSubrange(index(endIndex, offsetBy: -3)..<index(endIndex, offsetBy: -2), with: ".")
    }
    
    //returns the number characters of the currency - can be used to count value size independent of currency symbol and separators
    func cleanFormat() -> String {
        let currencySymbol = Locale.current.currencySymbol
        
        return replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: currencySymbol ?? "", with: "")
    }
}
