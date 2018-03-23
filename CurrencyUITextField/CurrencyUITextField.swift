//
//  CurrencyTextField.swift
//  CurrencyTextField
//
//  Created by Felipe Lefèvre Marino on 3/21/18.
//  Copyright © 2018 Felipe Lefèvre Marino. All rights reserved.
//

import UIKit

class CurrencyUITextField: UITextField {
    
    var symbolType: CurencySymbolType = .dollar
    var currencyFormatter = NumberFormatter()

    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureFormatterAndKeyboard()
        addTarget()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureFormatterAndKeyboard()
        addTarget()
    }
    
    // MARK: Configure text formatter and keyboard
    private func configureFormatterAndKeyboard() {
        keyboardType = UIKeyboardType.decimalPad
        
        if symbolType == .currentLanguage {
            let userLanguage = Locale.preferredLanguages.first!
            currencyFormatter.currencySymbol = CurencySymbolType(language: userLanguage).rawValue
            
        } else {
            currencyFormatter.currencySymbol = symbolType.rawValue
        }
    }
    
    // MARK: Text Did Change target
    private func addTarget() {
        addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }

    // MARK: Action
    @objc private func textDidChange(_ textField: CurrencyUITextField) {
        
    }
}
