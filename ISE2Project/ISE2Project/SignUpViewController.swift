//
//  SignUpViewController.swift
//  ISE2Project
//
//  Created by AL19 on 15/06/23.
//

import UIKit
import FirebaseAuth
import Firebase
class SignUpViewController: UIViewController {

    @IBOutlet weak var SignUpPasswordError: UILabel!
    @IBOutlet weak var SignUpUsernameError: UILabel!
    @IBOutlet weak var UsernameSignUp: UITextField!
    @IBOutlet weak var PasswordSignUp: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func EmailSignUpChanged(_ sender: Any) {
        if let username = UsernameSignUp.text {
            if username.lowercased().contains("@gmail.com") {
                SignUpUsernameError.text = "Valid username"
                SignUpUsernameError.textColor = UIColor.systemGreen
            } else {
                SignUpUsernameError.text = "username must be a valid Gmail address"
                SignUpUsernameError.textColor = UIColor.systemBrown
            }
        }
    }
    @IBAction func PasswordSignUpChanged(_ sender: Any) {
        if let password = PasswordSignUp.text, password.count >= 6 {
            SignUpPasswordError.text = "Strong Password"
            SignUpPasswordError.textColor = UIColor.systemGreen
        } else {
            SignUpPasswordError.text = "Password length must be at least 6"
            SignUpPasswordError.textColor = UIColor.systemBrown

        }
    }
    
    @IBAction func SignUpButtonTapped(_ sender: Any) {
        if UsernameSignUp.text?.isEmpty == true{
            SignUpUsernameError.text = "Required"
            return
        }
        if PasswordSignUp.text?.isEmpty == true{
            SignUpPasswordError.text = "Required"
            return
        }
        signup()
    }
    @IBAction func AlreadyhaveAnAccount(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated: true)
    }
    
    
    func signup(){
        
        Auth.auth().createUser(withEmail: UsernameSignUp.text!, password: PasswordSignUp.text!){(authResult, error) in
            guard let user = authResult?.user, error == nil else
            {
                print("Error \(error?.localizedDescription)")
                return
            }
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "navControl")
            vc.modalPresentationStyle = .overFullScreen
            self.present(vc,animated: true)
        }
    }
}
