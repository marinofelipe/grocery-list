//
//  CurrencyTextField.swift
//  CurrencyTextField
//
//  Created by Felipe Lefèvre Marino on 3/21/18.
//  Copyright © 2018 Felipe Lefèvre Marino. All rights reserved.
//

import UIKit

public class UICurrencyTextField: UITextField {
    
    private var numberFormatter = NumberFormatter()
    private var separatorsCount: Int?
    public var maximumIntegers: Int? {
        didSet {
            guard let maxIntegers = maximumIntegers else { return }
            numberFormatter.maximumIntegerDigits = maxIntegers
        }
    }

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    public convenience init(numberFormatter: NumberFormatter, frame: CGRect) {
        self.init(frame: frame)
        self.numberFormatter = numberFormatter
        configureKeyboard()
        addTarget()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initComponents()
    }
    
    required public init?(coder aDecoder: NSCoder) {
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
        numberFormatter.maximumIntegerDigits = 7
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
            
            //set cursor position before upadting text
            
            var currentPosition = selectedTextRange?.end
            let wasAtEnd = currentPosition == endOfDocument
            var isFirstInput: Bool = false
            
            guard text.numeralFormat().count > 0 else {
                textField.text?.removeAll()
                return
            }
            
            if text.count == 1 {
                text = "0.0\(text)"
                isFirstInput = true
            }
            
            text = text.numeralFormat()
                
            let maxDigitsCount = numberFormatter.maximumIntegerDigits + numberFormatter.maximumFractionDigits
            if text.numeralFormat().count > maxDigitsCount {
                text.removeLast()
            }
            
            text.addDecimalSeparator()
            if let doubleValue = Double(text.replacingOccurrences(of: numberFormatter.currencySymbol, with: "")) {
                textField.text = numberFormatter.string(from: NSNumber(value: doubleValue))
                
                isFirstInput ? currentPosition = endOfDocument : ()
            }
            
            setCursor(currentPosition, atEnd: wasAtEnd)
        }
    }
    
    private func setCursor(_ position: UITextPosition?, atEnd: Bool = false) {
        //TODO: more than one index selected - analyze and treat if necessary
//        guard let currentPosition = selectedTextRange?.end, currentPosition == selectedTextRange?.end else { return }
        
        guard var position = position else { return }
        atEnd ? position = endOfDocument : ()
        selectedTextRange = textRange(from: position, to: position)
    }
}
