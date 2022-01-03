//
//  TrainingViewController.swift
//  xPose
//
//  Created by Xavier Welscher on 13.12.21.
//

import UIKit

class TrainingViewController: UIViewController {
    
    @IBOutlet var contentViews: [UIView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        contentViews.forEach { view in
            view.layer.cornerRadius = 20
            view.clipsToBounds = false
            view.layer.shadowColor = UIColor.gray.cgColor
            view.layer.shadowOpacity = 0.3
            view.layer.shadowOffset = .init(width: .zero, height: 6.5)
            view.layer.shadowRadius = 10
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
