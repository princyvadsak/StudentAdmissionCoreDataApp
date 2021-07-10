//
//  DetailStudVC.swift
//  StudentAdmissionCoreDataApp
//
//  Created by DCS on 10/07/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class DetailStudVC: UIViewController {

   
    //var arrayitem = [UIBarButtonItem]()
    private var studArray = Array<Student>()
    private let mytableview = UITableView()
    
    private let mybutton:UIButton = {
        let button = UIButton()
        button.setTitle("Logout", for: .normal)
        button.addTarget(self, action: #selector(logoutTapped), for: .touchUpInside)
        button.backgroundColor = #colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc private func logoutTapped()
    {
        UserDefaults.standard.removeObject(forKey: "username")
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    override func viewDidLoad() {
        title = "Student Details"
        view.addSubview(mytableview)
        view.addSubview(mybutton)
        
        setuptableview()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchData()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mytableview.frame=view.bounds
        mybutton.frame = CGRect(x: 150, y: view.frame.height - 120, width: 80, height: 40)
        
    }
    
    @objc private func addbuttontapped()
    {
        let vc = CUstudVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func fetchData()
    {
        studArray = CoreDataHandler.shared.fetchData()
        
        mytableview.reloadData()
    }
    
}
extension DetailStudVC : UITableViewDataSource,UITableViewDelegate{
    private func setuptableview(){
        mytableview.dataSource = self
        mytableview.delegate = self
        mytableview.register(UITableViewCell.self, forCellReuseIdentifier: "studcell")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studcell", for : indexPath)
        
        let stud = studArray[indexPath.row]
        
        cell.textLabel!.text = "\(stud.name!) | \t \(stud.age) | \t \(stud.classes!)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(studArray[indexPath.row])
        
        let vc = CUstudVC()
        vc.stud = studArray[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        let stud = studArray[indexPath.row]
        
        CoreDataHandler.shared.deleteData(for: stud) { [weak self]  in
            
            print("Data deleted")
            
            //self.fetchData()
            
            self?.studArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
    }
}

