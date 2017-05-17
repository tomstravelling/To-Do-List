//
//  AddViewController.swift
//  To Do List
//
//  Created by Tom de Visser on 15-05-17.
//  Copyright © 2017 Tom de Visser. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var importanceSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.itemField.delegate = self
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func addNewTask(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if itemField.text != "" {
            
            let task = Task(context: context)
            task.item = itemField.text!
            task.important = importanceSwitch.isOn
            navigationController?.popViewController(animated: true)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
        } else {
            
            print("Task textfield is empty")
            
        }
        
    }
    
}
