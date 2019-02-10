//
//  SwipingController.swift
//  SwipingPageView
//
//  Created by wonkwh on 11/02/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit

class SwipingController: UICollectionViewController {
    
    override func viewDidLoad() {
        
        navigationItem.title = "Paging Swipe Feature"
        
        collectionView.backgroundColor = .white
        
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -44).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

