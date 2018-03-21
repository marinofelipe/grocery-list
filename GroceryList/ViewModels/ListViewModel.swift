//
//  ListViewModel.swift
//  GroceryList
//
//  Created by Felipe Lefèvre Marino on 3/20/18.
//  Copyright © 2018 Felipe Lefèvre Marino. All rights reserved.
//

//
//  ListViewModel.swift
//  GroceryList
//
//  Created by Felipe Lefevre Marino on 19/03/18.
//  Copyright © 2018 Felipe Lefèvre Marino. All rights reserved.
//

import UIKit

class ListViewModel {
    
    var mockedItems = ["apple", "beers", "bananas", "cookie", "rice", "bread", "chocolate", "water", "avocado", "salt", "sugar", "milk "]
    
    var title: String? = "Grocery List" //mocked
    var items: [ItemCellViewModel]?
    
    //    private let coreDataService: CoreDataService
    
    
    init() {
        //        coreDataService = CoreDataService()
    }
    
    func fetchItems() {
        //will fetch items saved in core data
        
        //for now they will be mocked
        
        items = []
        for item in mockedItems {
            let itemCell = ItemCellViewModel()
            itemCell.item = item
            
            items?.append(itemCell)
        }
    }
}
