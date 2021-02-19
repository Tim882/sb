//
//  UserVC.swift
//  SB
//
//  Created by Тимур on 29.01.2021.
//  Copyright © 2021 Тимур. All rights reserved.
//

import UIKit

protocol UserVCDelegate: class {
    func update(name: String, age: String)
}

class UserVC: UIViewController, UserVCDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var diagnosisLabel: UILabel!
    @IBOutlet weak var contactsTable: UITableView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? EditProfileVC else {
            return
        }
        destination.delegate = self
    }
    
    func update(name: String, age: String) {
        ageLabel.text = age
        nameLabel.text = name
    }
    
    let cellIdentifier = "contactCell"
    var contactNameArray = [String]()
    var contactNumberArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        contactNameArray.append("Some name")
        contactNumberArray.append("777-77-77")
    }

    @IBAction func delete_contact(_ sender: UIButton) {
        contactsTable.isEditing = !contactsTable.isEditing
    }
}

extension UserVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let cellText = contactNameArray[indexPath.row] + " " + contactNumberArray[indexPath.row]
        cell.textLabel?.text = cellText
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contactNumberArray.remove(at: indexPath.row)
            contactNameArray.remove(at: indexPath.row)
            contactsTable.deleteRows(at: [indexPath], with: .left)
        }
        
        return
    }
}
