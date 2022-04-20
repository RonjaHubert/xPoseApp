//
//  customTableViewCell.swift
//  xPose
//
//  Created by Xavier Welscher on 04.01.22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var cellTitle: UILabel!
    @IBOutlet var cellDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        contentView.layer.cornerRadius = 30
        contentView.backgroundColor = UIColor(named: "xPose Secondary Background Color")
        
        contentView.layer.shadowColor = UIColor(named: "xPose Shadow Color")?.cgColor
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowOffset = .init(width: .zero, height: 6.5)
        contentView.layer.shadowRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0))
        
    }
    
}
