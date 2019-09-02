//
//  NewsVC.swift
//  HW1
//
//  Created by Kirill Titov on 30/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "topNewsHystoryCell"

class NewsVC: UICollectionViewController {
    
    var names: [[String]] = [["A"], ["B"], ["C", "Casper"], ["D", "Dinosaur"], ["E"], ["F"], ["G"], ["H", "Hare"], ["I"], ["J"], ["K"], ["L"], ["M"], ["N", "Narwhal"], ["O"], ["P", "Pikachu", "PolarBear"], ["Q"], ["R"], ["S"], ["T", "Tiger"], ["U"], ["V"], ["V"], ["X"], ["Y"], ["Z"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UINib(nibName: "TopNewsCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TopNewsCell
        
        for i in names {
            if i.count > 1 {
                for j in i {
                    if j.count > 1 {
                        cell.setFreind(UIImage(named: j)!)
                    }
                }
            }
        }
//        cell.setFreind(UIImage(named: names[indexPath.section][indexPath.row+1])!)
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
