//
//  ViewController.swift
//  To Do List
//
//  Created by Tom de Visser on 15-05-17.
//  Copyright © 2017 Tom de Visser. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var tasks : [Task] = []
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tasks = makeTaskArray()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if tasks[indexPath.row].important {
            cell.textLabel?.text = "❗️ " + tasks[indexPath.row].item
        } else {
            cell.textLabel?.text = tasks[indexPath.row].item
        }
        
        return cell
    }
    
    @IBAction func addTask(_ sender: Any) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! AddViewController
            nextVC.previousVC = self
        } else if segue.identifier == "detailSegue" {
            let nextVC = segue.destination as! DetailViewController
            nextVC.task = sender as! Task
            nextVC.selectedIndex = selectedIndex
            nextVC.previousVC = self
        } else {
            print("Segue not found")
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "detailSegue", sender: task)
        
    }
    
    func makeTaskArray() -> [Task] {
        
        let task1 = Task()
        task1.item = "Finish this app"
        task1.important = true
        
        return [task1]
        
    }
    
}

