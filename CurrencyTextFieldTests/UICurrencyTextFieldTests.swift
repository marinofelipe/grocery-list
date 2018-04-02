//
//  CurrencyTextFieldTests.swift
//  CurrencyTextFieldTests
//
//  Created by Felipe Lefèvre Marino on 3/21/18.
//  Copyright © 2018 Felipe Lefèvre Marino. All rights reserved.
//

import XCTest
@testable import UICurrencyTextField

class CurrencyTextFieldTests: XCTestCase {
    
    var textField: UICurrencyTextField?
    var numberFormatter: NumberFormatter?
    
    override func setUp() {
        super.setUp()
        textField = UICurrencyTextField(frame: CGRect.zero)
        numberFormatter = NumberFormatter()
    }
    
    override func tearDown() {
        textField = nil
        numberFormatter = nil
        super.tearDown()
    }
    
    func testInit() {
        XCTAssertNotNil(textField)
    }
    
    func testMaxDigitsCount() {
        for _ in 0...10 {
            var text = textField?.text ?? ""
            text += "1"
            
            textField!.text = text
            textField!.textDidChange(textField!)
        }
        
        if let onlyDigitsText = textField?.text?.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: numberFormatter!.currencySymbol, with: "") {
            
            XCTAssertEqual(onlyDigitsText.count, 6)
        }
    }
    
    func testDeletingDigits() {
        for _ in 0...10 {
            var text = textField?.text ?? ""
            text += "1"
            
            textField!.text = text
            textField!.textDidChange(textField!)
        }
        
        var currentText = textField?.text
        currentText?.removeLast()
        textField!.text = currentText
        textField!.textDidChange(textField!)
        
        currentText = textField?.text
        currentText?.removeLast()
        textField!.text = currentText
        textField!.textDidChange(textField!)
        
        if let withoutCurrencySymbolText = textField?.text?.replacingOccurrences(of: numberFormatter!.currencySymbol, with: "") {
            XCTAssertEqual(withoutCurrencySymbolText, "11.11")
        }
    }
    
    func testMovingDecimalSeparator() {
        
    }
    
    func testLastCharacterRemoval() {
        
    }
    
    func testPerformanceExample() {
        self.measure {
            
        }
    }
    
}
