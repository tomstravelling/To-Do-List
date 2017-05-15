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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        if tasks[indexPath.row].important {
            cell.textLabel?.text = "❗️ " + tasks[indexPath.row].item!
        } else {
            cell.textLabel?.text = tasks[indexPath.row].item
        }
        
        return cell
    }
    
    @IBAction func addTask(_ sender: Any) {
        
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    func getTasks() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            tasks = try context.fetch(Task.fetchRequest()) as [Task]
        } catch {
            print("Could not fetch data")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailSegue" {
            let nextVC = segue.destination as! DetailViewController
            nextVC.task = sender as? Task
            nextVC.selectedIndex = selectedIndex
        } else {
            print("Segue not found")
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let task = tasks[indexPath.row]
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "detailSegue", sender: task)
        
    }
    
}

