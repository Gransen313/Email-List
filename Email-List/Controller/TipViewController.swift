//
//  TipViewController.swift
//  Email-List
//
//  Created by Sergey Borisov on 27.04.2020.
//  Copyright © 2020 Sergey Borisov. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
    
    var tipText: String?

    @IBOutlet weak var tipView: UIView!
    @IBOutlet weak var tipLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tipView.layer.cornerRadius = 15
        tipLabel.text = tipText
    }

    @IBAction func okButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
