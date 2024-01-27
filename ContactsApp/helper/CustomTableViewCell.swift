//
//  CustomTableViewCell.swift
//  ContactsApp
//
//  Created by Aruuke Turgunbaeva on 26/1/24.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    private let contactsCellView: UIView = {
        let cell = UIView()
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 10
        return cell
    }()
    
    private let NameAndPhoneStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        return view
    }()
    
    private let contactImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "star")
        return view
    }()
    
    private let contactNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    private let contactPhoneNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .init(hex: "#8A8A8D")
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(contactsCellView)
        contactsCellView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalTo(contentView.snp.bottom)//.offset(-2)
            make.height.equalTo(60)
        }
        
        contactsCellView .addSubview(contactImage)
        contactImage.snp.makeConstraints { make in
            make.top.equalTo(contactsCellView.snp.top).offset(12)
            make.leading.equalTo(contactsCellView.snp.leading).offset(15)
            make.height.width.equalTo(40)
        }
        
        contactsCellView.addSubview(NameAndPhoneStackView)
        NameAndPhoneStackView.snp.makeConstraints { make in
            make.top.equalTo(contactsCellView.snp.top).offset(11)
            make.leading.equalTo(contactImage.snp.trailing).offset(8)
            make.bottom.equalTo(contactsCellView.snp.bottom).offset(-11)
            make.centerY.equalTo(contactImage.snp.centerY)
        }
        NameAndPhoneStackView.addArrangedSubview(contactNameLabel)
        NameAndPhoneStackView.addArrangedSubview(contactPhoneNumberLabel)
        
    }
    
    func setImgData(_ image: String, contactName: String, mobileNumber: String){
        contactImage.image = UIImage(systemName: image)
        contactNameLabel.text = contactName
        contactPhoneNumberLabel.text = mobileNumber
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
