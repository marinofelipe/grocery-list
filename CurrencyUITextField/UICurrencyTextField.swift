//
//  CurrencyTextField.swift
//  CurrencyTextField
//
//  Created by Felipe Lefèvre Marino on 3/21/18.
//  Copyright © 2018 Felipe Lefèvre Marino. All rights reserved.
//

import UIKit

class UICurrencyTextField: UITextField {
    
    private var numberFormatter = NumberFormatter()

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    convenience init(numberFormatter: NumberFormatter, frame: CGRect) {
        self.init(frame: frame)
        self.numberFormatter = numberFormatter
    }
    
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
        numberFormatter.minimumIntegerDigits = 1
        numberFormatter.alwaysShowsDecimalSeparator = true
        
        numberFormatter.numberStyle = .currency
    }
    
    private func configureKeyboard() {
        keyboardType = UIKeyboardType.numberPad
    }
    
    // MARK: Text Did Change target
    private func addTarget() {
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }

    // MARK: Action
    @objc func textDidChange(_ textField: UICurrencyTextField) {
        if var text = textField.text {
            
            //6 numbers
            guard text.numeralFormat().count <= 6 else {
                textField.text?.removeLast()
                return
            }
            
            if text.count == 1 {
                text = "0.0\(text)"
            } else {
                text = text.numeralFormat()
                text.addDecimalSeparator()
            }
            
            if let doubleValue = Double(text.replacingOccurrences(of: numberFormatter.currencySymbol, with: "")) {
                textField.text = numberFormatter.string(from: NSNumber(value: doubleValue))
            }
        }
    }
}
