//
//  AssessmentViewController.swift
//  ISE2Project
//
//  Created by AL19 on 03/07/23.
//

import UIKit

class AssessmentViewController: UIViewController {

    
    var earText : String?
    var fingersText: String?
    var eyeText: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    @IBOutlet weak var earTextField: UITextField!
    
    @IBOutlet weak var fingersTextField: UITextField!
    @IBOutlet weak var eyeTextField: UITextField!
    
    @IBOutlet weak var ScoreCurrent: UILabel!
    @IBAction func CheckScore1(_ sender: Any) {
        earText = earTextField.text
        fingersText = fingersTextField.text
        eyeText = eyeTextField.text
        var count = 0
        
            if earText == "2" {
                count += 10
            }
            if fingersText == "10" {
                count += 10
            }
            if eyeText == "2" {
                count += 10
            }
            
            print(count)
        ScoreCurrent.text = String(count)+"/30"
    }
    
    @IBAction func MoveNext(_ sender: Any) {
        
         func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "forward" {
                    if let subClassVC = segue.destination as? SubClassViewController {
                        subClassVC.earData = earTextField.text
                        subClassVC.eyeData = eyeTextField.text
                        subClassVC.fingersData = fingersTextField.text
                    }
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

}
