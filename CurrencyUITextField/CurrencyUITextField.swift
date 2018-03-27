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
        if var text = textField.text {
            
            if text.count == 1 {
                text = "0,0\(text)"
            } else {
                text = text.replacingOccurrences(of: numberFormatter.currencySymbol, with: "")
                text.moveDecimalSeparator()
            }
            
            let doubleValue = Double(text.replacingOccurrences(of: ",", with: ".").replacingOccurrences(of: numberFormatter.currencySymbol, with: ""))
            textField.text = numberFormatter.string(from: NSNumber(value: doubleValue!))
        }
    }
}

// MARK: Adjust currency text separator
extension String {
    
    mutating func moveDecimalSeparator() {
        if let separatorIndex = index(of: ".") {
            let newInteger = self[index(separatorIndex, offsetBy: 1)..<index(separatorIndex, offsetBy: 2)]
            
            replaceSubrange(separatorIndex..<index(separatorIndex, offsetBy: 1), with: newInteger)
            replaceSubrange(index(separatorIndex, offsetBy: 1)..<index(separatorIndex, offsetBy: 2), with: ".")
        }
    }
}
