//
//  NewsVC.swift
//  HW1
//
//  Created by Kirill Titov on 09/09/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {

    @IBOutlet weak var collectionV: UICollectionView!
    
//    @IBOutlet weak var tableV: UITableView!
    
    var color: [UIColor] = [#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1), #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1), #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), #colorLiteral(red: 0.3098039329, green: 0.2039215714, blue: 0.03921568766, alpha: 1), #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)]
    var names: [[String]] = [["A"], ["B"], ["C", "Casper"], ["D", "Dinosaur"], ["E"], ["F"], ["G"], ["H", "Hare"], ["I"], ["J"], ["K"], ["L"], ["M"], ["N", "Narwhal"], ["O"], ["P", "Pikachu", "PolarBear"], ["Q"], ["R"], ["S"], ["T", "Tiger"], ["U"], ["V"], ["V"], ["X"], ["Y"], ["Z"]]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionV.register(UINib(nibName: "TopNewsCell", bundle: nil), forCellWithReuseIdentifier: "TopNewsCell")
//        tableV.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        collectionV.dataSource = self
//        tableV.dataSource = self
    }

}
