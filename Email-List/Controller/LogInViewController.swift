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
        
        //Checking if text fields aren't empty.
        if let email = emailTextField.text, let password = passwordTextField.text {
            //Chacking if email and password are valid.
            if email.isValidEmail {
                if password.isValidPassword {
                    
                    //Try to sign in.
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        if let e = error {
                            print(e.localizedDescription)
                            self.performSegue(withIdentifier: Const.Segue.logInToTip, sender: e.localizedDescription)
                        } else {
                            self.performSegue(withIdentifier: Const.Segue.logInToList, sender: self)
                            print("User successfully logged in!")
                        }
                    }
                } else { performSegue(withIdentifier: Const.Segue.logInToTip, sender: Const.Sender.password) }
            } else { performSegue(withIdentifier: Const.Segue.logInToTip, sender: Const.Sender.email) }
        }
    }
    
    //Prepare Segue to change tipLabel.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Const.Segue.logInToTip {
            let destinationVC = segue.destination as! TipViewController
                
            switch sender as? String {
            case Const.Sender.email: destinationVC.tipText = "Email format isn't correct!"
            case Const.Sender.password: destinationVC.tipText = "Password must contain from 6 to 30 symbols. Only Latin letters, numbers and symbols @!-_? are allowed!"
            default:
                    destinationVC.tipText = sender as? String
            }
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
    private func dismissKey() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer( target: self, action: #selector(LogInViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    //Auxiliary function for func "dismissKey()".
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
