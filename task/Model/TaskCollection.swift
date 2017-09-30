//
//  TaskCollection.swift
//  task
//
//  Created by 中村太一 on 2017/09/23.
//  Copyright © 2017年 中村太一. All rights reserved.
//

import UIKit
import RealmSwift

class TaskCollection: NSObject {
    static let sharedInstance = TaskCollection()
    
    var realmTasks = List<Task>()
    var selectedRow: Int?
    
    override private init(){}
    func addTaskCollection(_ task: Task){
        self.realmTasks.append(task)
        self.save()
    }
    
    func updateTargetTask(_ title:String){
        let realm = try! Realm()
        let targetTask = try! self.getTargetTask()
        try! realm.write(){
            targetTask.title = title
        }
    }
    
    func deleteTargetTask(){
        let realm = try! Realm()
        let targetTask = try! self.getTargetTask()
        realmTasks.remove(objectAtIndex: self.selectedRow!)
        try! realm.write(){
            realm.delete(targetTask)
        }
        self.selectedRow = nil
    }
    
    func save() {
        let realm = try! Realm()
        try! realm.write(){
            realm.add(realmTasks)
        }
    }
    
    func fetchTasks() {
        let realm = try! Realm()
        // Realmに保存されてるDog型のオブジェクトを全て取得
        let realmTasks = realm.objects(Task.self)
        
        // ためしに名前を表示
        for realmTask in realmTasks {
            self.realmTasks.append(realmTask)
            print("name: \(realmTask.title) FILE: \(#file) LINE: \(#line)")
        }
    }
    
    func getTargetTask () throws -> Task {
        if let row = self.selectedRow {
            return self.realmTasks[row]
        }
        throw NSError(domain: "Task is not selected", code: -1, userInfo: nil)
    }

}
