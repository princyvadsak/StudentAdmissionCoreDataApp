//
//  CUstudVC.swift
//  StudentAdmissionCoreDataApp
//
//  Created by DCS on 10/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class CUstudVC: UIViewController {

    
    var stud:Student?
    
    private let nameTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Name"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return textfield
    }()
    
    private let ageTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Age"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return textfield
    }()
    
    private let classTextField:UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Class"
        textfield.textAlignment = .center
        textfield.borderStyle = .roundedRect
        textfield.textColor = #colorLiteral(red: 0.1921568662, green: 0.007843137719, blue: 0.09019608051, alpha: 1)
        textfield.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return textfield
    }()
    
    
    
    private let SaveButton:UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(SaveButtonTapped), for: .touchUpInside)
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
        view.addSubview(nameTextField)
        view.addSubview(ageTextField)
        view.addSubview(classTextField)
        view.addSubview(SaveButton)
        
        if let student = stud{
            nameTextField.text = student.name
            ageTextField.text = String(student.age)
            classTextField.text = student.classes
            
        }
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        
        let vw=view.frame.width
        //  let vh=view.frame.height
        
        nameTextField.frame = CGRect(x: 30, y: 100, width:vw - 80, height: 40)
        ageTextField.frame = CGRect(x: 30, y: 150, width: vw - 80, height: 40)
        classTextField.frame = CGRect(x: 30, y: 200, width: vw - 80, height: 40)
        SaveButton.frame = CGRect(x: 30, y: 260, width: vw - 80, height: 40)
    }
    
    @objc private func SaveButtonTapped()
    {
        let name = nameTextField.text!
        let age = Int(ageTextField.text!)!
        let classes = classTextField.text!
        
        if let student = stud{
            
            CoreDataHandler.shared.update(stud: student, name: name, age: age, classes: classes){ [weak self] in
                
                //                print("data got insert")
                self?.navigationController?.popViewController(animated: true)
            }
        }
        else{
            
            CoreDataHandler.shared.insert(name: name, age: age, classes: classes) { [weak self] in
                
                self?.navigationController?.popViewController(animated: true)
                
            }
        }
    }
    
    
}

