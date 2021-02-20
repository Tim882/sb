//
//  addContactVC.swift
//  SB
//
//  Created by Тимур on 15.02.2021.
//  Copyright © 2021 Тимур. All rights reserved.
//

import UIKit

class AddContactVC: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    
    weak var delegate: UserVCDelegate?
    
    var nameString = ""
    var numberString = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        nameString = nameTextField.text ?? ""
        numberString = numberTextField.text ?? ""
        
        delegate?.update_contacts_table(name: nameString, number: numberString)
        
        self.dismiss(animated: true, completion: nil)
    }
}
