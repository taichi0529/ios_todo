//
//  TaskListTableViewCell.swift
//  task
//
//  Created by 中村太一 on 2017/09/30.
//  Copyright © 2017年 中村太一. All rights reserved.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescript: UILabel!
    @IBOutlet weak var imageHoge: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
