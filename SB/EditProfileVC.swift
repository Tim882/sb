//
//  editProfileVC.swift
//  SB
//
//  Created by Тимур on 13.02.2021.
//  Copyright © 2021 Тимур. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {

    var nameString = ""
    var ageString = ""
    var diagnosisString = ""
    var surnameString = ""
    
    var diagnosisArray = ["Диагноз 1", "Диагноз 2", "Диагноз 3"]
    
    weak var delegate: UserVCDelegate?
    
    @IBOutlet weak var diagnosisPickerView: UIPickerView!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBAction func saveProfile(_ sender: UIButton) {
        nameString = "Имя: " + nameTextField.text!
        ageString = "Возраст: " + ageTextField.text!
        diagnosisString = "Диагноз: " + diagnosisString
        surnameString = "Фамилия: " + surnameTextField.text!
        delegate?.update_profile(name: nameString, surname: surnameString, age: ageString, diagnosis: diagnosisString)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if diagnosisArray.count > 0 {
            diagnosisString = diagnosisArray[0]
        }

        diagnosisPickerView.dataSource = self
        diagnosisPickerView.delegate = self
    }
}

extension EditProfileVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        diagnosisArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = diagnosisArray[row]
        return result
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        diagnosisString = diagnosisArray[row]
    }
}
