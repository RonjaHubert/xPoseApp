//
//  customTableViewCell.swift
//  xPose
//
//  Created by Xavier Welscher on 04.01.22.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet var cellTitle: UILabel!
    @IBOutlet var cellDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
