//
//  PrototypeViewController.swift
//  xPose
//
//  Created by Xavier Welscher on 09.12.21.
//

// legacy code - used for the first view controller which contained the side menu

import UIKit

class PrototypeViewController: UIViewController, SideMenuViewControllerDelegate {

    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var sideMenuBackgroundView: UIView!
    @IBOutlet weak var leadingConstraintSideMenuView: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraintSideBackgroundView: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraintSideBackgroundView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        sideMenuBackgroundView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    var sideMenuViewController:SideMenuViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "sideMenuSegue") {
            if let controller = segue.destination as? SideMenuViewController {
                self.sideMenuViewController = controller
                self.sideMenuViewController?.delegate = self
            }
        }
    }
    
    func hideSideMenu() {
        self.hideSideMenuView()
    }
    
    private func hideSideMenuView() {
        self.sideMenuBackgroundView.isHidden = true
        self.leadingConstraintSideMenuView.constant = -280
    }
    
    @IBAction func showSideMenu(_ sender: Any) {
        print("Hello")
        sideMenuBackgroundView.isHidden = false
        self.leadingConstraintSideMenuView.constant = 0
        self.leadingConstraintSideBackgroundView.constant = 0
        self.trailingConstraintSideBackgroundView.constant = 0
    }

}
