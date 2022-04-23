//
//  LoginViewController.swift
//  xPose
//
//  Created by Xavier Welscher on 28.12.21.
//

import UIKit
import SQLite3

class LoginViewController: UIViewController {

    @IBOutlet weak var headerBackground: UIView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var saveAccountCheckbox: UIButton!
    
    @IBOutlet weak var failedLabel: UILabel!
    
    var isPasswordSaved:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupViews()
        
        // button to toggle password visibility
        initToggleButton()
        
        // error message for wrong account information
        failedLabel.isHidden = true
        
    }
    
    // test login feature
    @IBAction func loginPressed(_ sender: UIButton) {
        checkPlaceholder()
    }
    
    // button at the right side of the password textfield
    func initToggleButton() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: ((passwordText.frame.height) * 0.7), height: ((passwordText.frame.height) * 0.7)))
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        //button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 3)
        button.tintColor = UIColor(named: "xPose Tint Color")
        button.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
        passwordText.rightViewMode = .always
        passwordText.rightView = button
    }
    
    // toggles the visibility of the password textfield
    @objc func togglePassword() {
        if (passwordText.isSecureTextEntry) {
            passwordText.isSecureTextEntry = false
        } else if (!passwordText.isSecureTextEntry) {
            passwordText.isSecureTextEntry = true
        }
    }
    
    @IBAction func saveAccountPressed(_ sender: UIButton) {
        
        if (!isPasswordSaved) {
            isPasswordSaved = true
            sender.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else if (isPasswordSaved) {
            isPasswordSaved = false
            sender.setImage(UIImage(systemName: "square"), for: .normal)
        }
    
    }
    
    func checkPlaceholder() {
        let email = emailText.text
        let password = passwordText.text
        
        if(email!.isEmpty || password!.isEmpty) {
            return
        }
        
        if (emailText.text == "admin@xcode.de" && passwordText.text == "admin") {
            performSegue(withIdentifier: "login", sender: self)
        } else {
            failedLabel.isHidden = false
        }
    }
    
    func setupViews() {
        // set Header Attributes
        // TODO: fix custom class avoiding following definitions
        headerBackground.clipsToBounds = true
        headerBackground.layer.cornerRadius = 35
        headerBackground.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        // set Content View Attributes
        contentView.layer.cornerRadius = 20
        contentView.clipsToBounds = false
        contentView.layer.shadowColor = UIColor(named: "xPose Shadow Color")?.cgColor
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowOffset = .init(width: .zero, height: 6.5)
        contentView.layer.shadowRadius = 10
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
