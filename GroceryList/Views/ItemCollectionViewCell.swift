//
//  ItemCollectionViewCell.swift
//  GroceryList
//
//  Created by Felipe Lefèvre Marino on 3/20/18.
//  Copyright © 2018 Felipe Lefèvre Marino. All rights reserved.
//

import UIKit
import UICurrencyTextField

class ItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var textField: UICurrencyTextField!
}
