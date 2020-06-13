//
//  ViewController.swift
//  HW1
//
//  Created by Kirill Titov on 15/08/2019.
//  Copyright © 2019 Kirill Titov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollViewBackend: UIScrollView!
    
    @IBOutlet weak var topLabelConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var indecator1: UILabel!
    @IBOutlet weak var indecator2: UILabel!
    @IBOutlet weak var indecator3: UILabel!
    
    
    var animationFlag: Bool = false
    let personSessia = Session.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidLayoutSubviews() {
        topLabelConstraint.constant = -30
        self.loginLabel.alpha = 0
        self.loginTextField.alpha = 0
        self.passwordLabel.alpha = 0
        self.passwordTextField.alpha = 0
        self.enterButton.alpha = 0
        
        indecator1.layer.cornerRadius = indecator1.frame.height/2
        indecator2.layer.cornerRadius = indecator1.frame.height/2
        indecator3.layer.cornerRadius = indecator1.frame.height/2
        
        indecator1.layer.masksToBounds = true
        indecator2.layer.masksToBounds = true
        indecator3.layer.masksToBounds = true
        
        self.indecator1.alpha = 0.2
        self.indecator2.alpha = 0.2
        self.indecator3.alpha = 0.2
    }
    

    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        loginTextField.text = personSessia.login
        passwordTextField.text = personSessia.password
    }

    
    override func loadViewIfNeeded() {
        super.loadViewIfNeeded()
        
        indecator1.clipsToBounds = true
        indecator1.layer.cornerRadius = indecator1.frame.height/2
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !animationFlag {
            animationFlag = true
            
            self.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.3,
                           delay: 1,
                           animations: {
                            self.topLabelConstraint.constant = 40
                            self.view.layoutIfNeeded()})
            {_ in
                self.view.layoutIfNeeded()
                UIView.animate(withDuration: 0.4,
                               animations: {
                                self.loginLabel.alpha = 1
                                self.loginTextField.alpha = 1
                                self.passwordLabel.alpha = 1
                                self.passwordTextField.alpha = 1
                                self.enterButton.alpha = 1
                                self.view.layoutIfNeeded()})}
            
            UIView.animate(withDuration: 0.6,
                           animations: {
                            self.indecator1.alpha = 1})
            {_ in
                UIView.animate(withDuration: 0.6,
                               animations: {
                                self.indecator2.alpha = 1
                })
                {_ in
                    UIView.animate(withDuration: 0.6,
                                   animations: {
                                    self.indecator3.alpha = 1
                    })
                }
            }
        }
    }
}



// MARK: - Keyboard modifications
extension ViewController {
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let size = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: size.height, right: 0)
        
        self.scrollViewBackend.contentInset = insets
        self.scrollViewBackend.scrollIndicatorInsets = insets
    }
    
    @objc func keyboardWillHidden(notification: Notification) {
        let insets = UIEdgeInsets.zero
        self.scrollViewBackend.contentInset = insets
        self.scrollViewBackend.scrollIndicatorInsets = insets
    }
}
