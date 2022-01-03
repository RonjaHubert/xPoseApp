//
//  SideMenuViewController.swift
//  xPose
//
//  Created by Xavier Welscher on 09.12.21.
//

import UIKit

protocol SideMenuViewControllerDelegate {
    func hideSideMenu()
}

class SideMenuViewController: UIViewController {
    
    @IBOutlet weak var sideMenuHeader: UIView!
    @IBOutlet weak var sideMenuButtonView: UIStackView!
    var delegate : SideMenuViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupSideMenuUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupSideMenuUI() {
        sideMenuHeader.layer.cornerRadius = 30
        sideMenuHeader.layer.maskedCorners = .layerMaxXMaxYCorner
        sideMenuButtonView.layer.cornerRadius = 30
    }

     @IBAction func clickAnyButton(_ sender: UIButton) {
         self.delegate?.hideSideMenu()
     }

}
