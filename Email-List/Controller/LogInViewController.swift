//
//  LogInViewController.swift
//  Email-List
//
//  Created by Sergey Borisov on 15.04.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        navigationItem.hidesBackButton = true
        
        self.dismissKey()
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        
        //Checking that text fields aren't empty.
        if let email = emailTextField.text, let password = passwordTextField.text {
            
            chekingTextFieldsValidity(email, password)
            
            if email.isValidEmail && password.isValidPassword {
                
                //Try to sign in.
                Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                    if let e = error {
                        print(e.localizedDescription)
                        self.emailTextField.text = ""
                        self.emailTextField.placeholder = "Wrong email or password"
                        self.passwordTextField.text = ""
                        self.passwordTextField.placeholder = "Wrong email or password"
                    } else {
                        self.performSegue(withIdentifier: Const.Segue.logInToList, sender: self)
                        print("User successfully logged in!")
                    }
                }
            }
        }
    }
    
    //Checking that email and password are valid. If not, fill textFields with tips.
    func chekingTextFieldsValidity(_ email: String, _ password: String) {
        
        if !email.isValidEmail {
            print("Email \(email) isn't valid!")
            emailTextField.text = ""
            emailTextField.placeholder = "Email isn't valid"
        }
        if !password.isValidPassword {
            print("Password \(password) isn't correct password")
            passwordTextField.text = ""
            passwordTextField.placeholder = "Password isn't valid"
        }
    }
    
    //Navigate to Register screen
    @IBAction func toRegisterPressed(_ sender: UIBarButtonItem) {
        
        navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {
    
    //Dismiiss keyboard when return button pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
    }
}

//MARK: - DismissKeyboard
extension LogInViewController {
    
    //Dismiss keyboard when tap somewhere outside the keyboard.
    func dismissKey() {
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(RegisterViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
    }
    
    //Auxiliary function for func "dismissKey()".
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
