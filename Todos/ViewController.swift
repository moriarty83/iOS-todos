//
//  ViewController.swift
//  Todos
//
//  Created by Christopher M Moriarty on 1/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tasks = ["Press + To Add a Task"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Setup
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "taskCount")
            UserDefaults().set(tasks, forKey: "tasks")
        }
        
        // Sets Table delegate and datasourc3e.
        tableView.delegate = self
        tableView.dataSource = self
        
        updateTasks()
    }

    
    func updateTasks(){
        tasks = UserDefaults().value(forKey: "tasks") as? [String] ?? [String]()
        print("tasks are \(tasks)")
        tableView.reloadData()
    }
    

    @IBAction func didTapAdd(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "create") as! CreateViewController
        vc.title = "New Todo"
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func didTapShowComplete(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "complete") as! CompleteViewController
        vc.title = "Complete"
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    
        let vc = storyboard?.instantiateViewController(withIdentifier: "show") as! ShowViewController
        vc.title = "Todo"
        vc.task = tasks[indexPath.row]
        vc.taskIndex = indexPath.row
        vc.update = {
            DispatchQueue.main.async {
                self.updateTasks()
            }
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
}

