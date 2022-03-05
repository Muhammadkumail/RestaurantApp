//
//  CollectionView.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//

import Foundation
import UIKit

class CollectionView {
    
    static var sharedInstance = CollectionView()
    private init(){}
    
    func getCollectionView(indetifier: String, view: UIView, cellSize: Double) -> UICollectionView {
        
        var collectionview: UICollectionView!
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: cellSize)
        
        collectionview = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionview.register(RestaurantListCell.self, forCellWithReuseIdentifier: indetifier)
        collectionview.showsVerticalScrollIndicator = false
        collectionview.backgroundColor = UIColor.white
        return collectionview
    }
}
