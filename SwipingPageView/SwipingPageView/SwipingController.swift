//
//  SwipingController.swift
//  SwipingPageView
//
//  Created by wonkwh on 11/02/2019.
//  Copyright © 2019 wonkwh. All rights reserved.
//

import UIKit

class MainCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}


class SwipingController: UICollectionViewController {
    
    let menuController = MenuController(collectionViewLayout: UICollectionViewFlowLayout())
    fileprivate let cellID = "MainCell"
    fileprivate let colors = [UIColor.blue, UIColor.yellow, UIColor.green]
    
    override func viewDidLoad() {
        
        navigationItem.title = "Paging Swipe Feature"
        
        collectionView.backgroundColor = .white
        
        let menuView = menuController.view!
        
        view.addSubview(menuView)
        menuView.backgroundColor = .yellow
        menuView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            menuView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuView.heightAnchor.constraint(equalToConstant: 60)
            ])

        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MainCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.isPagingEnabled = true
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: menuView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        setupCollectionViewLayout()
    }
    
    fileprivate func setupCollectionViewLayout() {
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            //            let padding: CGFloat = 16
            //            layout.sectionInset = .init(top: padding, left: padding, bottom: padding, right: padding)
            layout.minimumLineSpacing = 0
            layout.minimumInteritemSpacing = 0
            layout.scrollDirection = .horizontal
            layout.itemSize = .init(width: view.frame.width, height: view.frame.height - 60 - 44 - UIApplication.shared.statusBarFrame.height)
        }
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let offset = x / 3
        menuController.menuBar.transform = CGAffineTransform(translationX: offset, y: 0)
    }
}

extension SwipingController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MainCell
        cell.backgroundColor = colors[indexPath.item]
        return cell
    }
}
