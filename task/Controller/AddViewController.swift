//
//  AddViewController.swift
//  task
//
//  Created by 中村太一 on 2017/09/23.
//  Copyright © 2017年 中村太一. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    
    
    let taskCollection = TaskCollection.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGesture))
        self.view.addGestureRecognizer(tapRecognizer)
        
        textField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    //画面をタップすると、キーボードが閉じる動作
    @objc func tapGesture(sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    @IBAction func saveButtonDidTouch(_ sender: Any) {
        if(textField.text!.isEmpty){
            let alert = UIAlertController(title:"エラー", message: "タスクを入力して下さい", preferredStyle: UIAlertControllerStyle.alert)

            let action1 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {
                (action: UIAlertAction!) in
                print("アクション１をタップした時の処理")
            })
            alert.addAction(action1)
            
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let task = Task()
        task.title = textField.text!
        print(task.title)
        self.taskCollection.addTaskCollection(task)
        print (self.taskCollection.realmTasks)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    //リターンをタップすると、キーボードが閉じる動作
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
