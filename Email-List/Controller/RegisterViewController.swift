//
//  ViewController.swift
//  Email-List
//
//  Created by Sergey Borisov on 15.04.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        self.dismissKey()
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        //Checking that text fields aren't empty.
        if let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text {
            
            chekingTextFieldsValidity(email, password, confirmPassword)
            
            if email.isValidEmail && password.isValidPassword && confirmPassword.isValidPassword {
                
                if password == confirmPassword {
                    
                    //Try to register a new user.
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        if let e = error {
                            print(e.localizedDescription)
                        } else {
                            self.performSegue(withIdentifier: Const.Segue.registerToList, sender: self)
                            print("User successfully registered!")
                        }
                    }
                }
            }
        }
    }
    
    //Checking that text in each of textFields are valid. If not, fill textFields with tips.
    func chekingTextFieldsValidity(_ email: String, _ password: String, _ confirmPassword: String) {
        
        if !email.isValidEmail {
            print("Email's format isn't correct!")
            emailTextField.text = ""
            emailTextField.placeholder = "Email isn't valid"
        }
        if !password.isValidPassword {
            print("Password's format isn't correct!")
            passwordTextField.text = ""
            passwordTextField.placeholder = "Password isn't valid"
        }
        if !confirmPassword.isValidPassword {
            print("Confirmation password's format isn't correct!")
            confirmPasswordTextField.text = ""
            confirmPasswordTextField.placeholder = "Password isn't valid"
        }
        if password != confirmPassword {
            print("Password hasn't been confirmed!")
            confirmPasswordTextField.text = ""
            confirmPasswordTextField.placeholder = "Doesn't match with password"
        }
    }
}

//MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    
    //Dismiiss keyboard when return button pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
    }
}

//MARK: - DismissKeyboard
extension RegisterViewController {
    
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

//MARK: - Validity checking

extension String {
    
    //Checking email validity.
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "^([A-Za-z0-9_-]+\\.)*[A-Za-z0-9_-]+@[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*\\.[a-z]{2,6}$").evaluate(with: self)
    }
    
    //Checking password validity.
    var isValidPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Za-z0-9!@\\-_=?]{6,30}").evaluate(with: self)
    }
}
