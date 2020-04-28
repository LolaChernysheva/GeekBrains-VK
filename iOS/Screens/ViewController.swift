//
//  ViewController.swift
//  iOS
//
//  Created by Лолита Чернышева on 30/11/2019.
//  Copyright © 2019 Лолита Чернышева. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func pressButton(_ sender: Any) {
        guard let loginInput = login.text,
            let passwordInput = password.text   else {
            return
        }
        if loginInput == "admin" && passwordInput == "0000" {
            print("успешная авторизация")
        } else {
            print("введены неверные логин или пароль")
        }
        
    }
    override func viewDidLoad() {
        testAnimation()
        super.viewDidLoad()
        let hideAction = UITapGestureRecognizer (target: self, action: #selector(hideKeyboard))
            view.addGestureRecognizer(hideAction)
        }
        @objc func hideKeyboard() {
            view.endEditing(true)
    }
    
    func testAnimation () {
        UIView.animate(withDuration: 1.0,
                       delay: 1.0,
                       options: [.repeat, .autoreverse],
                       animations: {
                        self.login.transform = CGAffineTransform (scaleX: 1.1, y: 1.1)
        })
    }


}

