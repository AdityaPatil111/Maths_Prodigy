//
//  SubClassViewController.swift
//  ISE2Project
//
//  Created by AL19 on 04/07/23.
//

import UIKit

class SubClassViewController: UIViewController {

    @IBOutlet weak var pens: UITextField!
    @IBOutlet weak var sticks: UITextField!
    @IBOutlet weak var legs: UITextField!
   
    var earData: String?
    var eyeData: String?
    var fingersData: String?
    var pensText: String?
        var sticksText: String?
    var legsText:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        

        // Do any additional setup after loading the view.
    }
   
   
    @IBOutlet weak var presentscore: UILabel!
    @IBAction func checkScore(_ sender: Any) {
        pensText = pens.text
        sticksText = sticks.text
        legsText = legs.text
        var count = 0
        
            if legsText == "2" {
                count += 10
            }
            if sticksText == "4" {
                count += 10
            }
            if pensText == "6" {
                count += 10
            }
            print(count)
        presentscore.text = String(count)+"/30"
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
