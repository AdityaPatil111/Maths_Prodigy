//
//  ContactUsViewController.swift
//  ISE2Project
//
//  Created by AL19 on 03/07/23.
//

import UIKit

class ContactUsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func instabtn(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.instagram.com/11_aditya_patil_11")! as URL,options:[:],completionHandler: nil)
    }
    @IBAction func twitter(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.twitter.com/@AdityaPatil8975")! as URL,options:[:],completionHandler: nil)
    }
    
    @IBAction func facebook(_ sender: Any) {
        UIApplication.shared.open(URL(string: "https://www.facebook.com")! as URL,options:[:],completionHandler: nil)
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
