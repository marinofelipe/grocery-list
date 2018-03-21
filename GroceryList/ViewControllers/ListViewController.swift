//
//  ListViewController.swift
//  GroceryList
//
//  Created by Felipe Lefèvre Marino on 3/20/18.
//  Copyright © 2018 Felipe Lefèvre Marino. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel = ListViewModel() //will be optional set in the segue from lists controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = viewModel.title
        
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        
        collectionViewSetup()
        viewModel.fetchItems()
        collectionView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func collectionViewSetup() {
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.itemSize = CGSize(width: view.frame.width, height: 50.0)
    }
}

extension ListViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.items?.count ?? 0
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return viewModel.items![indexPath.item].cellInstance(collectionView, indexPath: indexPath)
    }
}

extension ListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let cell = collectionView.cellForItem(at: indexPath) else {
            return
        }
        
        let cellFrameOnView = view.convert(cell.frame, from: cell)
        
        
        //add subview animating from frame
        
        
        
        print("selected item: \(viewModel.items![indexPath.item])")
    }
}
