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
    
    //returns only
    func numeralFormat() -> String {
        return replacingOccurrences( of:"[^0-9]", with: "", options: .regularExpression)
    }
}
