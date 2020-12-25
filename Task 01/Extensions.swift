//
//  Extensions.swift
//  Task 01
//
//  Created by Hamza on 20/12/2020.
//

import Foundation
import UIKit

extension UITextField {

    func setUnderLine() {
        let border = CALayer()
        let width = CGFloat(0.5)
        border.borderColor = UIColor.white.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width - 10, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    @IBInspectable var placeHolderColor: UIColor? {
           get {
               return self.placeHolderColor
           }
           set {
               self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
           }
       }

}

@IBDesignable
class TidyTextField: UITextField {
    
    @IBInspectable var leftImage: UIImage? = nil
    @IBInspectable var leftPadding: CGFloat = 0
    @IBInspectable var gapPadding: CGFloat = 0
    
    private var textPadding: UIEdgeInsets {
        let p: CGFloat = leftPadding + gapPadding + (leftView?.frame.width ?? 0)
        return UIEdgeInsets(top: 0, left: p, bottom: 0, right: 5)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
           var r = super.leftViewRect(forBounds: bounds)
           r.origin.x += leftPadding
           return r
       }
       
       override func layoutSubviews() {
           super.layoutSubviews()
           setup()
       }
       
       private func setup() {
           if let image = leftImage {
               if leftView != nil { return } // critical!
               
               let im = UIImageView()
               im.contentMode = .scaleAspectFit
               im.image = image
               
               leftViewMode = UITextField.ViewMode.always
               leftView = im
               
           } else {
               leftViewMode = UITextField.ViewMode.never
               leftView = nil
           }
       }
   }

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
