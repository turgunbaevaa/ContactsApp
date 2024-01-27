//
//  MakerView.swift
//  ContactsApp
//
//  Created by Aruuke Turgunbaeva on 22/1/24.
//

import UIKit

class MakerView: UIViewController, UITextFieldDelegate{
    
    static let shared = MakerView()
    
    func makeLabel(text: String,
                   textColor: UIColor,
                   textSize: CGFloat, textWeight: UIFont.Weight,
                   textAlignment: NSTextAlignment = .left,
                   numberOfLines: Int = 0,
                   lineBreakMode: NSLineBreakMode = .byWordWrapping ) -> UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = .systemFont(ofSize: textSize, weight: textWeight)
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        label.lineBreakMode = lineBreakMode
        return label
    }
    
    func makeTextField(placeholder: String = "Enter number",
                       placeholderFontSize: CGFloat = 13.0,
                       textColor: UIColor = .black,
                       keyboardType: UIKeyboardType = .default,
                       leftViewMode: UITextField.ViewMode,
                       cornerRadius: CGFloat = 10) -> UITextField{
        let tf = UITextField()
        tf.placeholder = placeholder
        tf.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                      attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: placeholderFontSize)])
        tf.textColor = textColor
        tf.keyboardType = keyboardType
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 3))
        tf.leftView = view
        tf.leftViewMode = leftViewMode
        tf.layer.cornerRadius = cornerRadius
        tf.backgroundColor = .white
        return tf
    }
    
    func makeImage (image: UIImage? = nil,
                    cornerRadius: CGFloat,
                    contentMode: UIView.ContentMode) -> UIImageView {
        let img = UIImageView()
        img.layer.cornerRadius = cornerRadius
        img.image = image
        img.contentMode = contentMode
        return img
    }
    
    func makeView(backgroundColor: UIColor) -> UIView{
        let view = UIView()
        view.backgroundColor = backgroundColor
        return view
    }
    
    func makeButton(title: String?,
                    backgroundColor: UIColor,
                    titleColor: UIColor?,
                    cornerRadius: CGFloat,
                    font: UIFont) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.titleLabel?.font = font
        return button
    }
    
    func linkButton(title: String?,
                    backgroundColor: UIColor,
                    titleColor: UIColor? = .black,
                    cornerRadius: CGFloat,
                    font: UIFont,
                    imageName: String? = "defaultImageName") -> UIButton {
        let button = UIButton()
        button.backgroundColor = backgroundColor
        button.setTitleColor(titleColor, for: .normal)
        button.layer.cornerRadius = cornerRadius
        button.titleLabel?.font = font

        let image = UIImage(named: imageName ?? "ggl")
        button.setImage(image, for: .normal)
        
        if let title = title {
            button.setTitle(title, for: .normal)
        }

        // Use titleEdgeInsets to adjust spacing
        //button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)

        return button
    }

}
