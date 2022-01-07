//
//  TrainingViewController.swift
//  xPose
//
//  Created by Xavier Welscher on 13.12.21.
//

import UIKit

class TrainingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    let cells = [
        TrainingCell(cellText: "Training ohne Geräte",
                     cellImage: UIImage(named: "yogaImage")),
        TrainingCell(cellText: "Training mit Geräten",
                     cellImage: UIImage(named: "yogaImage")),
        TrainingCell(cellText: "Training mit der Schwingungsplattform",
                     cellImage: UIImage(named: "yogaImage"))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // make sure back button is hidden
        navigationItem.hidesBackButton = true
        
        // load custom cell
        let nib = UINib(nibName: "TrainingTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TrainingTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // amount of categories inside table view
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // amount of cells
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrainingTableViewCell", for: indexPath) as! TrainingTableViewCell
        cell.cellLabel.text = cells[indexPath.row].cellText
        cell.cellImageView.image = cells[indexPath.row].cellImage
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentImage = cells[indexPath.row].cellImage
        let imageCrop = currentImage!.getCropRatio()
        return tableView.frame.width / imageCrop
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

extension UIImage {
    func getCropRatio() -> CGFloat {
        let widthRatio = CGFloat(self.size.width / self.size.height)
        return widthRatio
    }
}

struct TrainingCell {
    let cellText: String!
    let cellImage: UIImage!
}
