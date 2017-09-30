//
//  TaskListTableViewController.swift
//  task
//
//  Created by 中村太一 on 2017/09/23.
//  Copyright © 2017年 中村太一. All rights reserved.
//

import UIKit

class TaskListTableViewController: UITableViewController {
    
    var currentSelectedTask: Task?

    let taskCollection = TaskCollection.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taskCollection.fetchTasks()
        self.tableView.register(UINib(nibName: "TaskListTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    @IBAction func addButtonDidTouch(_ sender: Any) {
        self.performSegue(withIdentifier: "ShowToAddViewController", sender: nil)
        
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.taskCollection.realmTasks.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // #warning Incomplete implementation, return the number of rows
        return 70
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! TaskListTableViewCell
        
        let task = self.taskCollection.realmTasks[indexPath.row]
        cell.labelTitle!.text = task.title
        cell.labelDescript!.text = "後で追加"
        
        cell.imageHoge!.image = UIImage.init(named: "m")
        
        
//        cell.textLabel!.text = self.taskCollection.realmTasks[indexPath.row].title
//        if (indexPath.row == 1){
//            cell.textLabel!.text = "aaaaaaaa"
//        }

        // Configure the cell...

        return cell
    }
    
    
    //⑤どこのセルがたっぷされたかの取得
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //どこのセルがタップされたかを変数に格納
        currentSelectedTask = self.taskCollection.realmTasks[indexPath.row]
        //画面遷移
        self.performSegue(withIdentifier: "next", sender: nil)
    }
    //⑥画面遷移時に値渡しをする時
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            //NextViewControllerのインスタンスを生成
            let nextViewController = segue.destination as! NextViewController
            //NextViewCOntrollerに定義したnextTaskにタップされたタスクを格納
            nextViewController.nextTask = self.currentSelectedTask
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
