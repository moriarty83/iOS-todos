//
//  TaskManager.swift
//  Todos
//
//  Created by Christopher M Moriarty on 1/11/22.
//

import Foundation

import UIKit

protocol TaskManagerDelegate{
    func updateTable()
    
}

struct TaskManager {
    var taskManagerDelegate: TaskManagerDelegate?
    
    var tasks = UserDefaults().value(forKey: "tasks") as? [String] ?? [String]()
    
    var completedTasks = UserDefaults().value(forKey: "completedTasks") as? [String] ?? [String]()

    
    var tableView: UITableView?
    
    mutating func deleteTask(taskIndex: Int)->Void{

        tasks.remove(at: taskIndex)
        saveTasks()
    }
    
    mutating func completeTask(taskIndex: Int)->Void{
        completedTasks.append(tasks[taskIndex])
        tasks.remove(at: taskIndex)
        saveTasks()
    }
    
    func saveTasks(){
        print(tasks)
        UserDefaults().set(tasks, forKey: "tasks")
        UserDefaults().set(completedTasks, forKey: "completedTasks")
    }
    

}
