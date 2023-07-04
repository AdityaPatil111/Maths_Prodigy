//
//  HamburgerViewController.swift
//  ISE2Project
//
//  Created by AL19 on 21/06/23.
//

import UIKit
import Firebase

class HamburgerViewController: UIViewController  {

    
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBAction func HamburgerExit(_ sender: Any) {
        UIView.animate(withDuration: 0.3, animations: {
                self.mainBackgroundView.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
                self.view.transform = CGAffineTransform(translationX: -self.view.bounds.width, y: 0)
            }) { (_) in
                self.dismiss(animated: false) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let MainUserScreenViewController1 = storyboard.instantiateViewController(identifier: "MainHome") as? MainUserScreenViewController {
                        MainUserScreenViewController1.modalPresentationStyle = .overFullScreen
                        self.present(MainUserScreenViewController1, animated: true)
                    }
                }
            }
    }
    @IBOutlet weak var UserDetail: UILabel!

    @IBAction func LogoutButtonTapped(_ sender: Any) {
        do {
                try Auth.auth().signOut()
                navigateToLoginScreen()
            } catch {
                print("Error logging out: \(error.localizedDescription)")
            }
    }
    private func navigateToLoginScreen() {
        // Assuming you have a ViewController named "LoginViewController"
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "Login")
        vc.modalPresentationStyle = .overFullScreen
        present(vc,animated: true)
    }
    
    @IBOutlet weak var mainBackgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpHamburgerUI()
        // Do any additional setup after loading the view.
        if let user = Auth.auth().currentUser {
            let email = user.email
            UserDetail.text = email
            UserDetail.adjustsFontSizeToFitWidth = true
            UserDetail.minimumScaleFactor = 0.5
            UserDetail.lineBreakMode = .byTruncatingMiddle
                    
              }
        
        
    }
    
    private func setUpHamburgerUI(){
        self.mainBackgroundView.layer.cornerRadius = 20
        self.mainBackgroundView.clipsToBounds = true

        self.profilePicture.layer.cornerRadius =  40
        self.profilePicture.clipsToBounds = true
    }
    
    @IBAction func clickOnButton(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
