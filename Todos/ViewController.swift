//
//  ViewController.swift
//  Todos
//
//  Created by Christopher M Moriarty on 1/8/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks = ["hello", "goodbye", "fun"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello world")
        // Do any additional setup after loading the view.
        
        // Setup
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true, forKey: "setup")
            UserDefaults().set(0, forKey: "taskCount")
        }
        
        // Sets Table delegate and datasourc3e.
        tableView.delegate = self
        tableView.dataSource = self
        
        updateTasks()
    }

    func updateTasks(){
        print("updateTasks")
        tasks.removeAll()
        
        guard let count = UserDefaults().value(forKey: "taskCount") as? Int else{
            return
        }
        
        print("count: \(count)")
        
        for x in 0...count{
            if let task = UserDefaults().value(forKey: "task_\(x+1)") as? String {
                
                tasks.append(task)
            }
        }
        
        print(tasks)
        
        tableView.reloadData()
        
    }
    
    @IBAction func didTapAdd(_ sender: UIBarButtonItem) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "create") as! CreateViewController
        vc.title = "New Todo"
        vc.update = {
            print("vc.update")
            DispatchQueue.main.async {
                self.updateTasks()
            }
            
        }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        print(tasks[indexPath.row])
        cell.textLabel?.text = tasks[indexPath.row]
        
        return cell
    }
    
    
}

