//
//  SlideViewController.swift
//  ISE2Project
//
//  Created by AL19 on 28/06/23.
//

import UIKit
import Firebase
import AVFoundation
class User {
    var name: String
    var email: String

    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}

class UserManager {
    static let shared = UserManager()
    var currentUser: User? = nil
}
class SlideViewController: UIViewController {
    var titleNames = ["Profile","Reference Books","Assessment","Contact Us","Logout"]
    var images = ["profile1","bookref","assess","contactus","logout"]

    @IBOutlet weak var TableView: UITableView!
    @IBOutlet weak var ContainerView: UIView!
    var viewOpen:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerTableCells()
        self.ContainerView.isHidden = true
        viewOpen = false
        TableView.delegate = self

    }
    
    func registerTableCells(){
        TableView.register(UINib(nibName: "TitleTableViewCell", bundle: nil), forCellReuseIdentifier: "TitleTableViewCell")
    }
    
    @IBAction func ButtonTapped(_ sender: Any) {
        viewOpen.toggle()
        ContainerView.isHidden = false
        TableView.isHidden = false
        if viewOpen{
            viewOpen = true
            ContainerView.frame = CGRect(x: 0, y: 88, width: 250, height: 808)
            TableView.frame = CGRect(x: 0, y: 0, width: 250, height: 808)
            
        }
        else
        {
            ContainerView.isHidden = true
            TableView.isHidden = true
            
        }
        }
    
    func CallD() {
        do {
            try Auth.auth().signOut()
            print("You are successfully signed out")
            // Clear user-related data from UserDefaults
            UserDefaults.standard.removeObject(forKey: "authToken")
            UserDefaults.standard.removeObject(forKey: "userId")
            
            // Clear cache
            URLCache.shared.removeAllCachedResponses()
            
            // Reset app state or any other relevant user-specific data
            UserManager.shared.currentUser = nil
            
            // Present the login view controller
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let loginViewController = storyboard.instantiateViewController(withIdentifier: "Login")
            loginViewController.modalPresentationStyle = .overFullScreen
            present(loginViewController, animated: true, completion: nil)
        } catch let error {
            print("Error signing out: \(error.localizedDescription)")
        }
    }
    func ProfileViewClicked(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "MainProfileView")
        loginViewController.modalPresentationStyle = .overFullScreen
        present(loginViewController, animated: true, completion: nil)
    }
    func AssessmentClicked(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "AssessmentView")
        loginViewController.modalPresentationStyle = .overFullScreen
        present(loginViewController, animated: true, completion: nil)
    }
    func ContactUs(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "ContactView")
        loginViewController.modalPresentationStyle = .overFullScreen
        present(loginViewController, animated: true, completion: nil)
    }
    func ReferenceClicked(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "ReferenceView")
        loginViewController.modalPresentationStyle = .overFullScreen
        present(loginViewController, animated: true, completion: nil)
    }
    func handleTitleTap(at index: Int) {
            
            switch index {
            case 0:
                ProfileViewClicked()
                
                break
            case 1:
                ReferenceClicked()
                
                break
            case 2:
                AssessmentClicked()
                
                break
            case 3:
                ContactUs()
                break
            case 4:
                CallD()
                break
            default:
                break
            }
        }

    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

 

extension SlideViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        handleTitleTap(at: indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension SlideViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleNames.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell") as! TitleTableViewCell
        cell.TitleLabel.text = titleNames[indexPath.row]
        cell.ImageIcon.image = UIImage(named: images[indexPath.row])
        return cell
    }
    
}



