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
    
    @IBAction func logInPressed(_ sender: UIBarButtonItem) {
        emailTextField.text = ""
        passwordTextField.text = ""
        confirmPasswordTextField.text = ""
        performSegue(withIdentifier: Const.Segue.registerToLogIn, sender: self)
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        //Check if text fields aren't empty.
        if let email = emailTextField.text, let password = passwordTextField.text, let confirmPassword = confirmPasswordTextField.text {
            //Check if email, password and confirmation are valid.
            if email.isValidEmail {
                if password.isValidPassword {
                    if password == confirmPassword {
                        
                        //Try to register a new user.
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            if let e = error {
                                print(e.localizedDescription)
                                self.performSegue(withIdentifier: Const.Segue.registerToTip, sender: e.localizedDescription)
                            } else {
                                self.performSegue(withIdentifier: Const.Segue.registerToList, sender: self)
                                print("User successfully registered!")
                            }
                        }
                    } else { performSegue(withIdentifier: Const.Segue.registerToTip, sender: Const.Sender.confirm) }
                } else { performSegue(withIdentifier: Const.Segue.registerToTip, sender: Const.Sender.password) }
            } else { performSegue(withIdentifier: Const.Segue.registerToTip, sender: Const.Sender.email) }
        }
    }
    
    //Prepare Segue to change tipLabel.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Const.Segue.registerToTip {
            let destinationVC = segue.destination as! TipViewController
            
            switch sender as? String {
            case Const.Sender.email: destinationVC.tipText = "Email format isn't correct!"
            case Const.Sender.password: destinationVC.tipText = "Password must contain from 6 to 30 symbols. Only Latin letters, numbers and symbols @!-_? are allowed!"
            case Const.Sender.confirm: destinationVC.tipText = "Password for confirm doesn't match with password!"
            default:
                destinationVC.tipText = sender as? String
            }
        }
    }
}

//MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {

    //Dismiiss keyboard when return button pressed.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

//MARK: - DismissKeyboard
extension RegisterViewController {
    
    //Dismiss keyboard when tap somewhere outside the keyboard.
    private func dismissKey() {
        
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
        NSPredicate(format: "SELF MATCHES %@", "^([A-Za-z0-9]+\\.)*[A-Za-z0-9]+@[A-Za-z0-9]+(\\.[A-Za-z0-9]+)*\\.[a-z]{2,6}$").evaluate(with: self)
    }
    
    //Checking password validity.
    var isValidPassword: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Za-z0-9!@\\-_=?]{6,30}").evaluate(with: self)
    }
}
