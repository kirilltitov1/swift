//
//  CollectionViewControllerFromMoreVC.swift
//  HW1
//
//  Created by Kirill Titov on 15/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewControllerFromMoreVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        return cell
    }
}
