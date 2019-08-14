//
//  ForMoreClasses.swift
//  HW1
//
//  Created by Kirill Titov on 14/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class ForMoreClasses: UIViewController {

    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var navigation: UINavigationItem!
    
    
    var MoreTitle: String = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: MoreTitle)
        navigation.title = MoreTitle
    }
    
    

}
