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
    
    //returns the number characters of the currency - can be used to count value size independent of currency symbol and separators
    func cleanFormat() -> String {
        let currencySymbol = Locale.current.currencySymbol
        
        return replacingOccurrences(of: currencySymbol ?? "", with: "")
    }
}
