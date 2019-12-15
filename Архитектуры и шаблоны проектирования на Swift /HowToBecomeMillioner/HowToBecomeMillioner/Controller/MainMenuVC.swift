//
//  MainMenuVC.swift
//  HowToBecomeMillioner
//
//  Created by Kirill Titov on 14/12/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "GameVCSegue":
            guard let destination = segue.destination as? GameVC
                else { return }
            destination.delegate = self
            
//        case "RecordsTVCSegue":
//            guard let destination = segue.destination as? RecordsTVC
//                else { return }
//            destination
            
        default:
            break
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}


//  MARK: - Extensions

extension MainMenuVC: GameVCDelegate {
    func endGame(withRecord record: Record) {
        resultLabel.text = "Результат последней сессии: " + String(record.value)
     }
}
