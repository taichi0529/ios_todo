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
    
    func addTaskCollection(_ task: Task){
        self.realmTasks.append(task)
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
            print("name: \(realmTask.title)")
        }
    }

}
