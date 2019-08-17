//
//  SettingsCollectionVC.swift
//  HW1
//
//  Created by Kirill Titov on 16/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

private let reuseIdentifier = "SettingsCell"

var dateForSettings:[String] = ["Notification", "Don`t disturb", "Account",
                                "Appearance", "Appearance", "Privacy", "Black List",
                                "Balance", "Music Subscription", "About Application"]

class SettingsCollectionVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
}

extension SettingsCollectionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width) / 2.2, height: 300)
    }
}

extension SettingsCollectionVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SettingsCell", for: indexPath) as! SettingsCell
        
        cell.image.image = UIImage(named: dateForSettings[indexPath.row])
        cell.label.text = dateForSettings[indexPath.row]
        
        return cell
    }
    
}
