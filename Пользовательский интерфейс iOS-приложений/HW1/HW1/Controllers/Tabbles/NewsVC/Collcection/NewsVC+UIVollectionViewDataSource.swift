//
//  NewsCollectionV+UIVollectionViewDataSource.swift
//  HW1
//
//  Created by Kirill Titov on 16/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit
import CoreLocation



extension NewsVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return color.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopNewsCell", for: indexPath) as! TopNewsCell
        
        cell.setColorFromCell(color[indexPath.row])
        
        for i in names  {
            if i.count > 1 {
                for j in i {
                    if j.count > 1 {
                        cell.setFreindImageFromCell(UIImage(named: j)!)
                    }
                }
            }
        }
        
        return cell
    }
}
