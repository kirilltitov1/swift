//
//  NewsCollectionV.swift
//  HW1
//
//  Created by Kirill Titov on 31/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class NewsCollectionV: UICollectionView {
    

    var names: [[String]] = [["A"], ["B"], ["C", "Casper"], ["D", "Dinosaur"], ["E"], ["F"], ["G"], ["H", "Hare"], ["I"], ["J"], ["K"], ["L"], ["M"], ["N", "Narwhal"], ["O"], ["P", "Pikachu", "PolarBear"], ["Q"], ["R"], ["S"], ["T", "Tiger"], ["U"], ["V"], ["V"], ["X"], ["Y"], ["Z"]]
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}


extension NewsCollectionV: UICollectionViewDataSource {
    
    override func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) {
        register(UINib(nibName: "TopNewsCell", bundle: nil), forCellWithReuseIdentifier: "topNewsHystoryCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 71
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "topNewsHystoryCell", for: indexPath) as! TopNewsCell
        
        for i in names {
            if i.count > 1 {
                for j in i {
                    if j.count > 1 {
                        cell.setFreind(UIImage(named: j)!)
                    }
                }
            }
        }
        return cell
    }
}
