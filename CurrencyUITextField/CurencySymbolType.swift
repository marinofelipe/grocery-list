//
//  CurrencySymbol.swift
//  CurrencyUITextField
//
//  Created by Felipe Lefèvre Marino on 3/23/18.
//  Copyright © 2018 Felipe Lefèvre Marino. All rights reserved.
//

enum CurencySymbolType: String {
    case euro = "€"
    case dollar = "$"
    case brazilianReal = "R$"
    case currentLanguage
    
    //TODO: Add support for all european countries.. asia, africa, oceania, americas, so on..
    init(language: String) {
        if language.contains("pt") || language.contains("BR") {
            self =  .brazilianReal
        } else if language.contains("GB") {
            self = .euro
        } else {
            self = .dollar
        }
    }
}
