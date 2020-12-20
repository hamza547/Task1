//
//  ViewController.swift
//  Task 01
//
//  Created by Hamza on 20/12/2020.
//

import UIKit
import RKDropdownAlert

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pwd: UITextField!
    
    let EMAIL_REGEX = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let PASSWORD_REGEX = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[\\w~@#$%^&*+=`|{}:;!.?\"()\\[\\]-]{12,20}"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        email.setUnderLine()
        pwd.setUnderLine()
        
        self.hideKeyboardWhenTappedAround()
    }

    @IBAction func einloggen(_ sender: Any) {
        
        validate()
    }
    
    //  MARK: Validation method to check email and password
    func validate()  {
        let eText = email.text
        let password = pwd.text
        
        if eText == "" {
            showFailAlert(message: "Email is required")
        }
        else if password == "" {
            showFailAlert(message: "Password is required")
            
        } else {
            if !isValidEmail(testStr: eText!){
                showFailAlert(message: "Email is invalid")
            }
            else if !isValidPassword(testStr: password!){
                showFailAlert(message: "Password is invalid")
            }
            else {
                showSuccessAlert(message: "Welcome SONE")
            }
        }
    }
    
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = EMAIL_REGEX
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func isPasswordValid(_ password : String) -> Bool{
        
        if password.count >= 6 {
            return true
        }
        return false
    }
    
    func isValidPassword(testStr:String?) -> Bool {
        guard testStr != nil else { return false }
        
        // at least one uppercase,
        // at least one digit
        // at least one lowercase
        // 8 characters total
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", PASSWORD_REGEX)
        return passwordTest.evaluate(with: testStr)
    }
    
    // Function to Show Alerts
    
    func showAlert(_ title: String, message: String, handler: ((UIAlertAction) -> Void)?) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: handler)
        ac.addAction(ok)
        present(ac, animated: true, completion: nil)
    }
    
    func showSuccessAlert(message : String){
        
        RKDropdownAlert.show()
        RKDropdownAlert.title("", message: message , backgroundColor: UIColor.green, textColor: UIColor.white)
        
    }
    
    func showFailAlert(message : String){
        
        RKDropdownAlert.show()
        RKDropdownAlert.title("", message: message , backgroundColor: UIColor.red, textColor: UIColor.white)
    }
}
