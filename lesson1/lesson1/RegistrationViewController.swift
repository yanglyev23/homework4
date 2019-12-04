//
//  RegistrationViewController.swift
//  lesson1
//
//  Created by Admin on 30.11.2019.
//  Copyright © 2019 Heads and Hands. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var fnameTextField: UITextField!
    @IBOutlet weak var snameTextField: UITextField!
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repasswordTextField: UITextField!

    private var keyboardHeight: CGFloat = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        fnameTextField.returnKeyType = UIReturnKeyType.next
        snameTextField.returnKeyType = UIReturnKeyType.next
        mailTextField.returnKeyType = UIReturnKeyType.next
        phoneTextField.returnKeyType = UIReturnKeyType.next
        dateTextField.returnKeyType = UIReturnKeyType.next
        passwordTextField.returnKeyType = UIReturnKeyType.next
        repasswordTextField.returnKeyType = UIReturnKeyType.go
        
        scrollView.delegate = self
        
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDisplay(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardDisplay(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        stackView.arrangedSubviews
        .compactMap { $0 as? UITextField }
        .forEach { $0.addTarget(self, action: #selector(beginEditing(sender:)), for: .editingDidBegin)}
    }

    @objc func keyboardDisplay(notification: Notification) {
        guard let userInfo = notification.userInfo else {
            return
        }

        guard let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {
            return
        }

        let keyboardHeight = keyboardFrame.cgRectValue.height

        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentInset.bottom = keyboardHeight
            self.scrollView.verticalScrollIndicatorInsets.bottom = keyboardHeight
        }
    }
    
    @IBAction func beginEditing(sender: UITextField){
        let visibleArea = scrollView.frame.height - keyboardHeight
        let centerY = visibleArea / 2.0
        let convertedFrame = view.convert(sender.frame, from: sender.superview)
        let diff = convertedFrame.midY + centerY
        
        let minContentOffset = -scrollView.adjustedContentInset.top
        let maxContentOffset = (scrollView.contentSize.height + scrollView.adjustedContentInset.bottom + keyboardHeight) - scrollView.frame.height - centerY
        
        let newContentOffsetY = min(max(scrollView.contentOffset.y + diff, minContentOffset), maxContentOffset)
  
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveLinear, .beginFromCurrentState], animations: {self.scrollView.contentOffset.y = newContentOffsetY}, completion: nil)
    }
    
    
    @IBAction func endEditting(sender: UITextField){
        if fnameTextField == sender {
            print("First name: \(String(describing: sender.text))")
            snameTextField.becomeFirstResponder()
        }
        else if snameTextField == sender {
            print("Second name: \(String(describing: sender.text))")
            mailTextField.becomeFirstResponder()
        }
        else if mailTextField == sender {
            print("Email: \(String(describing: sender.text))")
            phoneTextField.becomeFirstResponder()
        }
        else if phoneTextField == sender {
            print("Phone: \(String(describing: sender.text))")
            dateTextField.becomeFirstResponder()
        }
        else if dateTextField == sender {
            print("Date: \(String(describing: sender.text))")
            passwordTextField.becomeFirstResponder()
        }
        else if passwordTextField == sender {
            print("Password: \(String(describing: sender.text))")
            repasswordTextField.becomeFirstResponder()
        }
        else {
            sender.resignFirstResponder()
        }
    }
}

extension RegistrationViewController: UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scaleY = 1 + (max(min(scrollView.contentOffset.y / scrollView.frame.height, 1), 0))*2
    }
}
