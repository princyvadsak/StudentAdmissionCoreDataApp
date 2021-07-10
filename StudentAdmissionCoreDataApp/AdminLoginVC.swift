//
//  AdminLoginVC.swift
//  StudentAdmissionCoreDataApp
//
//  Created by DCS on 10/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class AdminLoginVC: UIViewController {

        
        
        private let usernameTextField:UITextField = {
            let textfield = UITextField()
            textfield.placeholder = "Username"
            textfield.textAlignment = .center
            textfield.borderStyle = .roundedRect
            textfield.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            textfield.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
            return textfield
        }()
        
        private let passwordTextField:UITextField = {
            let textfield = UITextField()
            textfield.placeholder = "Password"
            textfield.textAlignment = .center
            textfield.borderStyle = .roundedRect
            textfield.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            textfield.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
            textfield.isSecureTextEntry = true
            return textfield
        }()
        
        private let mybutton:UIButton = {
            let button = UIButton()
            button.setTitle("Login", for: .normal)
            button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
            button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            button.layer.cornerRadius = 6
            return button
        }()
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            view.backgroundColor = .white
            let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "bg5.jpg")
            backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
            self.view.insertSubview(backgroundImage, at: 0)

            view.addSubview(usernameTextField)
            view.addSubview(passwordTextField)
            view.addSubview(mybutton)
            
        }
        
        
        
        override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
            let vw=view.frame.width
            //let vh=view.frame.height
            usernameTextField.frame = CGRect(x: 40, y: 200, width:vw-80, height: 40)
            passwordTextField.frame = CGRect(x: 40, y: 260, width: vw - 80, height: 40)
            mybutton.frame = CGRect(x: 40, y: 350, width: vw - 80, height: 40)
            
            
        }
        let username = "Admin"
        let password = "admin"
        
        @objc private func loginTapped()
        {
            if username == usernameTextField.text! && password == passwordTextField.text! {
                UserDefaults.standard.set(usernameTextField.text!, forKey: "email")
                let vc = RDstudVC()
                navigationController?.pushViewController(vc, animated: true)
            } else {
                let alert = UIAlertController(title: "Alert!", message: "Email and Password didn't match", preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(ok)
                present(alert, animated: true, completion: nil)
            }
        }
}


