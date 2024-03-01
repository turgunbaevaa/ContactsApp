//
//  MyContactsViewController.swift
//  ContactsApp
//
//  Created by Aruuke Turgunbaeva on 21/1/24.
//

import UIKit
import SnapKit

class MyContactsViewController: UIViewController, UITableViewDataSource{
    
    private let contactTableView = UITableView()
    
    private let contactList: [ContactList] = [ContactList(image: "person", contactName: "Jane Cooper",mobileNumber: "(270) 555-0117"),
                                             ContactList(image: "person", contactName: "Devon Lane", mobileNumber: "(308) 555-0121"),
                                             ContactList(image: "person", contactName: "Darrell Steward", mobileNumber: "(684) 555-0102"),
                                             ContactList(image: "person", contactName: "Devon Lane", mobileNumber: "(704) 555-0127"),
                                             ContactList(image: "person", contactName: "Courtney Henry", mobileNumber: "(505) 555-0125"),
                                             ContactList(image: "person", contactName: "Wade Warren", mobileNumber: "(225) 555-0118"),
                                             ContactList(image: "person", contactName: "Bessie Cooper", mobileNumber: "(406) 555-0120"),
                                             ContactList(image: "person", contactName: "Robert Fox", mobileNumber: "(480) 555-0103"),
                                             ContactList(image: "person", contactName: "Jacob Jones", mobileNumber: "(702) 555-0122"),
                                             ContactList(image: "person", contactName: "Jenny Wilson", mobileNumber: "(239) 555-0108")]
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back-arrow") ?? UIImage(named: "back"), for: .normal)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(backButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        self.navigationItem.title = "My Contacts"
    }

    private func setupUI(){
        view.backgroundColor = .white
        setupContactTableView()
    }
    
    private func setupBackBtn(){
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leading).offset(15)
            make.height.width.equalTo(24)
        }
    }
    
    private func setupContactTableView(){
        contactTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        contactTableView.dataSource = self
        view.addSubview(contactTableView)
        contactTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20) 
            make.horizontalEdges.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactList.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.setImgData(contactList[indexPath.row].image, contactName: contactList[indexPath.row].contactName, mobileNumber: contactList[indexPath.row].mobileNumber)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        return cell
    }
    
    @objc private func backButtonTapped(_ sender: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
    
    
}


