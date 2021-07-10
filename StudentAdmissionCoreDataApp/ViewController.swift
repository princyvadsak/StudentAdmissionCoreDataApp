//
//  ViewController.swift
//  StudentAdmissionCoreDataApp
//
//  Created by DCS on 10/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let mybuttonAdmin:UIButton = {
        let button = UIButton()
        button.setTitle("Admin Login", for: .normal)
        button.addTarget(self, action: #selector(AdminloginTapped), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        button.layer.cornerRadius = 6
        return button
    }()
    
    private let mybuttonStud:UIButton = {
        let button = UIButton()
        button.setTitle("Student Login", for: .normal)
        button.addTarget(self, action: #selector(StudloginTapped), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc private func AdminloginTapped()
    {
        let vc = AdminLoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func StudloginTapped()
    {
        let vc = StudLoginVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Student Management System"
        view.addSubview(mybuttonAdmin)
        view.addSubview(mybuttonStud)
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "bg6.jpg")
        backgroundImage.contentMode =  UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let vw=view.frame.width
        mybuttonAdmin.frame = CGRect(x: 40, y: 180, width: vw - 80, height: 50)
        mybuttonStud.frame = CGRect(x: 40, y: 250, width: vw - 80, height: 50)
        
    }
    
    
}

