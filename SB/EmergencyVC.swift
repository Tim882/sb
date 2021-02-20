//
//  EmergencyVC.swift
//  SB
//
//  Created by Тимур on 29.01.2021.
//  Copyright © 2021 Тимур. All rights reserved.
//

import UIKit

class EmergencyVC: UIViewController {
    
    var emergencyCalled: Bool = false
    
    @IBOutlet weak var callButton: UIButton!
    
    @IBAction func callButton(_ sender: Any) {
        if (emergencyCalled) {
            self.callButton.setTitle("SOS", for: .normal)
        }
        else {
            self.callButton.setTitle("Отменить", for: .normal)
        }
        
        emergencyCalled = !emergencyCalled
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.callButton?.backgroundColor = UIColor.red
        
        self.callButton.frame = CGRect(x: self.callButton.frame.minX, y: self.view.bounds.height / 5 * 3.4, width: self.view.frame.height / 5, height: self.view.frame.height / 5)
        
        self.callButton.center.x = self.view.center.x
            
        self.callButton.layer.cornerRadius = 0.5 * self.callButton.bounds.size.width
        
        self.callButton.clipsToBounds = true
    }
}
