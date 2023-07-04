//
//  LoginViewController.swift
//  ISE2Project
//
//  Created by AL19 on 15/06/23.
//

import UIKit
import FirebaseAuth
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var PasswordError: UILabel!
    @IBOutlet weak var UsernameError: UILabel!
    @IBOutlet weak var UsernameLogin: UITextField!
    
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var PasswordLogin: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
       
    
    @IBAction func UsernameChange(_ sender: Any) {
        if let username = UsernameLogin.text {
            if username.lowercased().contains("@gmail.com") {
                UsernameError.text = "Valid username"
                UsernameError.textColor = UIColor.systemGreen
            } else {
                UsernameError.text = "username must be a valid Gmail address"
                UsernameError.textColor = UIColor.systemBrown
            }
        }
    }

    
    @IBAction func PasswordChange(_ sender: Any) {
        if let password = PasswordLogin.text, password.count >= 6 {
            PasswordError.text = ""
            PasswordError.textColor = UIColor.systemGreen
        } else {
            PasswordError.text = "Password length must be at least 6"
            PasswordError.textColor = UIColor.systemBrown

        }
    }

    override func viewDidAppear(_ animated: Bool) {
       
    }
    
    @IBAction func LoginButtonTapped(_ sender: Any) {
        
        ValidateFields()
        
    }
    
    @IBAction func CreateAnAccount(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SignUp")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated: true)
        
    }
    func ValidateFields(){
        if UsernameLogin.text?.isEmpty == true{
            UsernameError.text = "Required"
            return
        }
        if PasswordLogin.text?.isEmpty == true{
            PasswordError.text = "Required"
            return
        }
        login()
    }
    func login(){
        Auth.auth().signIn(withEmail: UsernameLogin.text!, password: PasswordLogin.text!){
            [weak self]authResult, err in
            guard self != nil else {return}
            if let err = err {
                print(err.localizedDescription)
                return
            }
            self!.checkUserInfo()
        }
    }
    func checkUserInfo() {
        if let currentUser = Auth.auth().currentUser {
            let authToken = currentUser.uid
            let userId = currentUser.uid
            // Store the authToken and userId values in UserDefaults or any other suitable storage mechanism
            UserDefaults.standard.set(authToken, forKey: "authToken")
            UserDefaults.standard.set(userId, forKey: "userId")
            
            // Proceed with further actions after successful login
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "navControl")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc, animated: true, completion: nil)
        } else {
            // User authentication failed, show error message
            let alert = UIAlertController(title: "Error", message: "Failed to authenticate user.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

}

