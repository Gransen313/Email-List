//
//  LogInViewController.swift
//  Email-List
//
//  Created by Sergey Borisov on 15.04.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func logInPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "LogInToList", sender: sender)
    }
    
    @IBAction func toRegisterPressed(_ sender: UIBarButtonItem) {
        
        navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: - UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
    }
}
