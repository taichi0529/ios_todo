//
//  NextViewController.swift
//  task
//
//  Created by 中村太一 on 2017/09/30.
//  Copyright © 2017年 中村太一. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var nextTask: Task!
    
    @IBOutlet weak var nextTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print (nextTask.title)
        self.nextTitle.text = nextTask.title
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
