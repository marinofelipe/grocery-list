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
    mutating func addDecimalSeparator() {
        let lastTwoChars = self[index(endIndex, offsetBy: -2)..<endIndex]
        replaceSubrange(index(endIndex, offsetBy: -2)..<endIndex, with: "." + lastTwoChars)
    }
    
    //returns the number characters of the currency - can be used to count value size independent of currency symbol and separators
    func cleanFormat() -> String {
        let currencySymbol = Locale.current.currencySymbol
        
        return replacingOccurrences(of: currencySymbol ?? "", with: "")
            .replacingOccurrences(of: ".", with: "")
            .replacingOccurrences(of: ",", with: "")
    }
}

