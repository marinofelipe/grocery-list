//
//  ItemCellViewModel.swift
//  GroceryList
//
//  Created by Felipe Lefèvre Marino on 3/21/18.
//  Copyright © 2018 Felipe Lefèvre Marino. All rights reserved.
//

import UIKit

@objc protocol CellViewModel: class {
    func cellInstance(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell
    @objc optional var rowHeight: CGFloat { get set }
}

var mockedColors: [UIColor] = [.red, .yellow, .blue, .orange, .green, .purple]

class ItemCellViewModel: CellViewModel {
    
    var item: String? = "item" //mocked
    var price: String?
    
    //would appear in every list
    var isFavorite: Bool = false
    
    
    func cellInstance(_ collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        if let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Cell.item, for: indexPath) as? ItemCollectionViewCell {
            
            itemCell.nameLabel.text = item
            itemCell.priceLabel.text = price
            
            itemCell.contentView.backgroundColor = mockedColors[Int(arc4random_uniform(UInt32(mockedColors.count)))]
            
            return itemCell
        }
        fatalError("identifier for Constants.Cell.item doesn't match class ItemCollectionViewCell or nib is not registered")
    }
}
