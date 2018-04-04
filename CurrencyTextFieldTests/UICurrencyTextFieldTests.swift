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
            
            let maxDigits = (textField?.maximumIntegers ?? 7) + 2
            
            XCTAssertEqual(onlyDigitsText.count, maxDigits)
        }
    }
    
    func testCustomMaxDigitsCount() {
        textField?.maximumIntegers = 4
        
        for _ in 0...10 {
            var text = textField?.text ?? ""
            text += "1"
            
            textField!.text = text
            textField!.textDidChange(textField!)
        }
        
        if let onlyDigitsText = textField?.text?.numeralFormat() {
            let maxDigits = (textField?.maximumIntegers ?? 7) + 2
            
            XCTAssertEqual(onlyDigitsText.count, maxDigits)
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
        
        if let withoutCurrencySymbolText = textField?.text?.numeralFormat() {
            XCTAssertEqual(withoutCurrencySymbolText, "1111111")
        }
    }
    
    func testPasting() {
        
    }
    
    func testInputingNotAtEndIndex() {
        
    }
    
    func testDeletingNotAtEndIndex() {
        
    }
    
    func testMovingDecimalSeparator() {
        
    }
    
    func testPerformanceExample() {
        self.measure {
            
        }
    }
    
}
