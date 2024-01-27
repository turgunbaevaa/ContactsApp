//
//  LogInViewController.swift
//  ContactsApp
//
//  Created by Aruuke Turgunbaeva on 21/1/24.
//

import UIKit
import SnapKit

class LogInViewController: UIViewController {
    
    private lazy var mainTitle: UILabel = MakerView.shared.makeLabel(text: "Login",
                                                                     textColor: .black,
                                                                     textSize: 18,
                                                                     textWeight: .semibold)
    
    private lazy var loginImage: UIImageView = MakerView().makeImage(image: UIImage(named: "user"),
                                                                     cornerRadius: 2,
                                                                     contentMode: .scaleAspectFit)
    
    private lazy var mainImage: UIImageView = MakerView().makeImage(image: UIImage(named: "img"),
                                                                    cornerRadius: 2,
                                                                    contentMode: .scaleAspectFit)
    
    private lazy var descTitle: UILabel = MakerView.shared.makeLabel(text: "Welcome back, Rohit thakur",
                                                                     textColor: .black,
                                                                     textSize: 14,
                                                                     textWeight: .regular)
    
    private lazy var imgTitle: UILabel = MakerView.shared.makeLabel(text: "Enter Your Mobile Number",
                                                                    textColor: .init(hex: "#F2796B"),
                                                                    textSize: 17,
                                                                    textWeight: .bold)
    
    private lazy var mobileNumberTF: UITextField = MakerView().makeTextField(leftViewMode: .always)
    
    private lazy var changeNumButton: UIButton = MakerView.shared.makeButton(title: "Change Number?",
                                                                             backgroundColor: .clear,
                                                                             titleColor: .init(hex: "#5B5B5B"),
                                                                             cornerRadius: 0,
                                                                             font: UIFont.systemFont(ofSize: 14))
    
    private lazy var logInButton: UIButton = MakerView().makeButton(title: "Log In",
                                                                    backgroundColor: .init(hex: "#F2796B"),
                                                                    titleColor: .white,
                                                                    cornerRadius: 15,
                                                                    font: UIFont.systemFont(ofSize: 17))
    
    private lazy var googleButton: UIButton = MakerView().linkButton(title: "Google",
                                                                     backgroundColor: .clear,
                                                                     titleColor: .black,
                                                                     cornerRadius: 10,
                                                                     font: UIFont.systemFont(ofSize: 17),
                                                                     imageName: "ggl")
    
    private lazy var accTitle: UILabel = MakerView.shared.makeLabel(text: "You Don’t have an account?",
                                                                    textColor: .init(hex: "#5B5B5B"),
                                                                    textSize: 12,
                                                                    textWeight: .regular)
    
    private lazy var signUpButton: UIButton = MakerView.shared.makeButton(title: "Sign Up",
                                                                          backgroundColor: .clear,
                                                                          titleColor: .black,
                                                                          cornerRadius: 0,
                                                                          font: UIFont.systemFont(ofSize: 12))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .init(hex: "#F6F6F6")
        setupTitle()
        setupLogInImage()
        
        setupDescTitle()
        
        setupImage()
        setupImgTitle()
        setupMobileNumTF()
        
        setupChangeNumBtn()
        setupLogInBtn()
        
        setupGoogleBtn()
        
        setupAccTitle()
        setupSignUpBtn()
    }
    
    private func setupTitle(){
        view.addSubview(mainTitle)
        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalToSuperview().offset(32)
        }
    }
    
    private func setupLogInImage(){
        view.addSubview(loginImage)
        loginImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(mainTitle.snp.trailing).offset(4)
            make.height.width.equalTo(20)
        }
    }
    
    private func setupDescTitle(){
        view.addSubview(descTitle)
        descTitle.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(-3)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(32)
        }
    }
    
    private func setupImage(){
        view.addSubview(mainImage)
        mainImage.snp.makeConstraints { make in
            make.top.equalTo(descTitle.snp.bottom).offset(50)
            make.centerX.equalTo(view.snp.centerX)
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(230)
        }
    }
    
    private func setupImgTitle(){
        view.addSubview(imgTitle)
        imgTitle.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(15)
            make.centerX.equalTo(view.snp.centerX)
        }
    }
    
    private func setupMobileNumTF(){
        view.addSubview(mobileNumberTF)
        mobileNumberTF.snp.makeConstraints { make in
            make.top.equalTo(imgTitle.snp.bottom).offset(30)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(43)
        }
        mobileNumberTF.keyboardType = .numberPad
        mobileNumberTF.delegate = self
    }
    
    private func setupChangeNumBtn(){
        view.addSubview(changeNumButton)
        changeNumButton.snp.makeConstraints { make in
            make.top.equalTo(mobileNumberTF.snp.bottom).offset(11)
            make.trailing.equalTo(view.snp.trailing).offset(-41)
        }
    }
    
    private func setupLogInBtn(){
        view.addSubview(logInButton)
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(changeNumButton.snp.bottom).offset(35)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(43)
        }
        logInButton.addTarget(self, action: #selector(showContactList(_:)), for: .touchUpInside)
    }
    
    private func setupGoogleBtn(){
        view.addSubview(googleButton)
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(logInButton.snp.bottom).offset(45)
            make.horizontalEdges.equalToSuperview().inset(180)
            make.height.equalTo(25)
            make.width.equalTo(70)
        }
    }
    
    private func setupAccTitle(){
        view.addSubview(accTitle)
        accTitle.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-20)
            make.leading.equalTo(view.snp.leading).offset(95)
        }
    }
    
    private func setupSignUpBtn(){
        view.addSubview(signUpButton)
        signUpButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).offset(-20)
            make.leading.equalTo(accTitle.snp.trailing).offset(3)
            make.centerY.equalTo(accTitle.snp.centerY)
        }
    }
    
    private func editTf(tf: UITextField, devastate: Bool, placeholder: String, borderColor: UIColor, placeholderColor: UIColor) {
            if devastate == true {
                tf.text = ""
            }
        mobileNumberTF.layer.borderColor = borderColor.cgColor
        mobileNumberTF.attributedPlaceholder = NSAttributedString(
                string: placeholder,
                attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
            )
        }
    
    @objc private func showContactList(_ sender: UIButton) {
        let vc = MyContactsViewController()
        
        if mobileNumberTF.hasText, let text = mobileNumberTF.text {
            if text.hasPrefix("996") && text.count == 12 {
                editTf(tf: mobileNumberTF, devastate: true, placeholder: "Enter Number", borderColor: .clear, placeholderColor: UIColor(hex: "545151"))
                navigationController?.pushViewController(vc, animated: true)
            }
            else {
                editTf(tf: mobileNumberTF, devastate: true, placeholder: "Enter 996 and 9 symbols", borderColor: .red, placeholderColor: .red)
            }
        }
        else {
            editTf(tf: mobileNumberTF, devastate: false, placeholder: "Fill the phone number", borderColor: .red, placeholderColor: .red)
        }
    }
}
    
    extension LogInViewController: UITextFieldDelegate {
        
        func textField(_ sender: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        }
}



