//
//  HomeViewController.swift
//  xPose
//
//  Created by Xavier Welscher on 09.12.21.
//

import UIKit

class HomeViewController: UIViewController, SideMenuViewControllerDelegate {

    @IBOutlet weak var headerBackgroundView: UIView!
    @IBOutlet var contentViews: [UIView]!
    
    @IBOutlet weak var sideMenuView: UIView!
    @IBOutlet weak var sideMenuBackgroundView: UIView!
    @IBOutlet weak var leadingConstraintSideMenuView: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraintSideBackgroundView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenuBackgroundView.isHidden = true
        
        // set Header Attributes
        headerBackgroundView.clipsToBounds = false
        headerBackgroundView.layer.cornerRadius = 35
        headerBackgroundView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

        // set Attributes for Elements (Views)
        contentViews.forEach { view in
            view.layer.cornerRadius = 20
            view.clipsToBounds = false
            view.layer.shadowColor = UIColor.gray.cgColor
            view.layer.shadowOpacity = 0.3
            view.layer.shadowOffset = .init(width: .zero, height: 6.5)
            view.layer.shadowRadius = 10
        }
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
        sideMenuBackgroundView.isHidden = false
        self.leadingConstraintSideMenuView.constant = 0
        self.trailingConstraintSideBackgroundView.constant = 0
    }

}
