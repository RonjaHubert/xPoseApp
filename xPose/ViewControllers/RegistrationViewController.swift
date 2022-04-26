//
//  RegistrationViewController.swift
//  xPose
//
//  Created by Ronja Hubert on 24.04.22.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }
    
   /* // button at the right side of the password textfield
    func initToggleButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: ((passwordText.frame.height) * 0.7), height: ((passwordText.frame.height) * 0.7)))
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        //button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 3)
        button.tintColor = UIColor(named: "xPose Tint Color")
        button.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
        passwordText.rightViewMode = .always
        passwordText.rightView = button
    }
    
    @objc func togglePassword() {
        if (passwordText.isSecureTextEntry) {
            passwordText.isSecureTextEntry = false
        } else if (!passwordText.isSecureTextEntry) {
            passwordText.isSecureTextEntry = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    */
}

