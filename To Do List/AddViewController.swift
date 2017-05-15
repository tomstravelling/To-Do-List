//
//  AddViewController.swift
//  To Do List
//
//  Created by Tom de Visser on 15-05-17.
//  Copyright © 2017 Tom de Visser. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var itemField: UITextField!
    @IBOutlet weak var importanceSwitch: UISwitch!
    
    var previousVC = ViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func addNewTask(_ sender: Any) {
        
        if itemField.text != "" {
            
            let task = Task()
            task.item = itemField.text!
            task.important = importanceSwitch.isOn
            previousVC.tasks.append(task)
            previousVC.tableView.reloadData()
            navigationController?.popViewController(animated: true)
            
        } else {
            
            print("Task textfield is empty")
            
        }
        
    }
    
}
