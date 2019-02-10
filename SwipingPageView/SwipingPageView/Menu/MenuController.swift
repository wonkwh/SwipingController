//
//  MenuController.swift
//  SwipingPageView
//
//  Created by wonkwh on 11/02/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit

class MenuController: UICollectionViewController {
    
    fileprivate let cellId = "MenuCell"
    
    fileprivate let titles = ["Home", "News", "Popular"]
    
    let menuBar: UIView = {
        let bar = UIView()
        bar.backgroundColor = .black
        bar.translatesAutoresizingMaskIntoConstraints = false
        return bar
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        setupCollectionViewLayout()
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        view.addSubview(menuBar)
        NSLayoutConstraint.activate([
            menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3),
            menuBar.heightAnchor.constraint(equalToConstant: 5)
            ])

    }
    
    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
//            let padding: CGFloat = 16
//            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.scrollDirection = .horizontal
            
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MenuController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        cell.title.text = titles[indexPath.item]
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MenuController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width / 3, height: view.frame.height)
    }
}



