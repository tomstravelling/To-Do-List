//
//  DetailViewController.swift
//  To Do List
//
//  Created by Tom de Visser on 15-05-17.
//  Copyright © 2017 Tom de Visser. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    
    var previousVC = ViewController()
    var task = Task()
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if task.important {
            taskLabel.text = "❗️ " + task.item
        } else {
            taskLabel.text = task.item
        }
        
    }
    
    
    @IBAction func finishedButton(_ sender: Any) {
        
        previousVC.tasks.remove(at: selectedIndex)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        
    }
    
}
