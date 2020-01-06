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

        updateResultLabel(withRecord: nil)
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
            
        default:
            break
        }
    }
    
    func updateResultLabel(withRecord record: Record?) {
        if let value: Int = record?.value {
// TODO: - исправить вылетание при конце игры поч то говорит что здесь “Unexpectedly found nil while implicitly unwrapping an Optional value“
            resultLabel.text = "Результат последней сессии: " + (value == 0 ? "0" : "\(value)")
        } else {
            let records = RecordsCaretaker().upload()
            resultLabel.text = "Результат последней сессии: " + (records.isEmpty ? "0" : String(records.last!.value))
        }
    }
    
}


//  MARK: - Extensions

extension MainMenuVC: GameVCDelegate {
    func endGame(withRecord record: Record) {
     }
}
