//
//  ViewController.swift
//  lesson1
//
//  Created by basalaev on 23.11.2019.
//  Copyright © 2019 Heads and Hands. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TitleLabel:UILabel!
    @IBOutlet weak var LoginTextField:UITextField!
    @IBOutlet weak var PasswordTextField:UITextField!
    @IBOutlet weak var LoginButton: Button!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoginTextField.returnKeyType = UIReturnKeyType.next
        PasswordTextField.returnKeyType = UIReturnKeyType.go
        LoginButton.addTarget(self, action: #selector(login(sender:)), for: .touchUpInside)
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector(("HideKeyboard")))
        view.addGestureRecognizer(tap)
    }

    @IBAction func login(sender: Button){
        print("Login: \(String(describing: LoginTextField.text))  Password: \(String(describing: PasswordTextField.text))")
    }
    @IBAction func hideKeyboard(){
        view.endEditing(true)
    }
    @IBAction func endEditting(sender: UITextField){
        if LoginTextField == sender {
            print("Login: \(String(describing: sender.text))")
            PasswordTextField.becomeFirstResponder()
        }
        else {
        print("Password: \(String(describing: sender.text))")
            sender.resignFirstResponder()
        }
    }
}

