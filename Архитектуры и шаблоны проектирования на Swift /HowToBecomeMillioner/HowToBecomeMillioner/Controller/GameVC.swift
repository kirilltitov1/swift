//
//  GameVC.swift
//  HowToBecomeMillioner
//
//  Created by Kirill Titov on 08/12/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

protocol GameVCDelegate: class {
    func endGame(withResult result: Int)
}

class GameVC: UIViewController {
    
    @IBOutlet weak var labelQuestion: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    weak var delegate: GameVCDelegate?
    
    var questions = Questions().questions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNextQuestion(self)
    }

    
    @IBAction func loadNextQuestion(_ sender: Any) {
        if let question = questions.popLast() {
            labelQuestion.text = question.question
            button1.setTitle(question.first, for: .normal)
            button2.setTitle(question.second, for: .normal)
            button3.setTitle(question.third, for: .normal)
            button4.setTitle(question.fourth, for: .normal)
        } else {
            
        }
    }
    
    
//   MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
    }
}


//   MARK: - Extensions
extension GameVC: GameVCDelegate {
    func endGame(withResult result: Int) {
        self.delegate?.endGame(withResult: result)
        self.dismiss(animated: true, completion: nil)
    }
}
