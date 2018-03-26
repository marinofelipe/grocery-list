//
//  CurrencyTextField.swift
//  CurrencyTextField
//
//  Created by Felipe Lefèvre Marino on 3/21/18.
//  Copyright © 2018 Felipe Lefèvre Marino. All rights reserved.
//

import UIKit

class CurrencyUITextField: UITextField {
    
    var numberFormatter = NumberFormatter()
    var inputedValues: Int = 0

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initComponents()
    }
    
    // MARK: Configuration
    private func initComponents() {
        configureFormatter()
        configureKeyboard()
        addTarget()
    }
    
    private func configureFormatter() {
        numberFormatter.minimumFractionDigits = 2
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.maximumIntegerDigits = 4
        numberFormatter.alwaysShowsDecimalSeparator = true
        
        numberFormatter.numberStyle = .currency
    }
    
    private func configureKeyboard() {
        keyboardType = UIKeyboardType.decimalPad
    }
    
    // MARK: Text Did Change target
    private func addTarget() {
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }

    // MARK: Action
    @objc private func textDidChange(_ textField: CurrencyUITextField) {
        
        inputedValues += 1
        
        if var text = textField.text {
            
            if text.count == 1 {
                text = "0,0\(text)"
            }
            
            let doubleValue = Double(text.replacingOccurrences(of: ",", with: ".").replacingOccurrences(of: numberFormatter.currencySymbol, with: ""))
            textField.text = numberFormatter.string(from: NSNumber(value: doubleValue!))
            
            if let currentCursorPosition = position(from: endOfDocument, offset: -inputedValues) {
                selectedTextRange = textRange(from: currentCursorPosition, to: currentCursorPosition)
            }
        }
    }
}
