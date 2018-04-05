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
            textField?.text?.append("1")
            textField!.textDidChange(textField!)
        }
        
        if let onlyDigitsText = textField?.text?.numeralFormat() {
            
            let maxDigits = (textField?.maximumIntegers ?? 7) + 2
            
            XCTAssertEqual(onlyDigitsText.count, maxDigits)
        }
    }
    
    func testCustomMaxDigitsCount() {
        textField?.maximumIntegers = 4
        
        for _ in 0...10 {
            textField?.text?.append("1")
            textField!.textDidChange(textField!)
        }
        
        if let onlyDigitsText = textField?.text?.numeralFormat() {
            let maxDigits = (textField?.maximumIntegers ?? 7) + 2
            
            XCTAssertEqual(onlyDigitsText.count, maxDigits)
        }
    }
    
    func testDeletingDigits() {
        for _ in 0...10 {
            textField?.text?.append("1")
            textField!.textDidChange(textField!)
        }
        
        textField!.text!.removeLast()
        textField!.textDidChange(textField!)
        
        textField!.text!.removeLast()
        textField!.textDidChange(textField!)
        
        if let numeralContent = textField?.text?.numeralFormat() {
            XCTAssertEqual(numeralContent, "1111111")
        }
    }
    
    func testPastingNonNumeralValues() {
        //without content
        textField!.text = ",,,,"
        textField!.textDidChange(textField!)
        
        XCTAssertEqual(textField!.text, "")
        
        //middle of the string
        textField?.text = (numberFormatter?.currencySymbol ?? "R$") + "3.456,45"
        textField!.text?.append(",,,,")
        textField!.textDidChange(textField!)
        
        if let comparableText = textField?.text?.removingCurrencySeparators() {
            XCTAssertEqual(comparableText, (numberFormatter?.currencySymbol ?? "R$") + "3.456,45".removingCurrencySeparators())
        }
        
        //middle of the string
        textField?.text = (numberFormatter?.currencySymbol ?? "R$") + "3.4,,,.56,45"
        textField!.textDidChange(textField!)
        
        if let comparableText = textField?.text?.removingCurrencySeparators() {
            XCTAssertEqual(comparableText, (numberFormatter?.currencySymbol ?? "R$") + "3.456,45".removingCurrencySeparators())
        }
    }
    
    func testInputingNotAtEndIndex() {
        
    }
    
    func testDeletingNotAtEndIndex() {
        
    }
    
    func testPerformanceExample() {
        self.measure {
            
        }
    }
    
}
