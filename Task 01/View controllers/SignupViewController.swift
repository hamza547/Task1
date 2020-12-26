//
//  SignupViewController.swift
//  Task 01
//
//  Created by Hamza on 26/12/2020.
//

import UIKit

class SignupViewController: BaseViewController {

    @IBOutlet weak var name: LogoTextField!
    
    @IBOutlet weak var email: LogoTextField!
    
    @IBOutlet weak var pwd: LogoTextField!
    
    @IBOutlet weak var cPwd: LogoTextField!
    
    @IBOutlet weak var dob: LogoTextField!
        
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        name.setUnderLine()
        email.setUnderLine()
        dob.setUnderLine()
        pwd.setUnderLine()
        cPwd.setUnderLine()
        

        showDatePicker()

    }
    
    @IBAction func dob(_ sender: Any) {
        showDatePicker()
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        
    }
    
    @IBAction func back(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)


    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
    }
    
    func showDatePicker(){
        //Formate Date
        datePicker.datePickerMode = .date

       //ToolBar
       let toolbar = UIToolbar();
       toolbar.sizeToFit()
       let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
      let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));

     toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)

        dob.inputAccessoryView = toolbar
      dob.inputView = datePicker

     }

      @objc func donedatePicker(){

       let formatter = DateFormatter()
       formatter.dateFormat = "dd/MM/yyyy"
        dob.text = formatter.string(from: datePicker.date)
       self.view.endEditing(true)
     }

     @objc func cancelDatePicker(){
        self.view.endEditing(true)
      }
}
