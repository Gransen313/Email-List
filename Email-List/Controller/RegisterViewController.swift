//
//  ViewController.swift
//  Email-List
//
//  Created by Sergey Borisov on 15.04.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "RegisterToList", sender: sender)
    }
    
    @IBAction func toLogInPressed(_ sender: UIBarButtonItem) {
    }
}

//MARK: - UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
    }
}

