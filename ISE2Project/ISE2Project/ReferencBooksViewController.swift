//
//  ReferencBooksViewController.swift
//  ISE2Project
//
//  Created by AL19 on 03/07/23.
//

import UIKit

class ReferencBooksViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func OpneFirstBook(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www2.ed.gov/parents/academic/help/math/math.pdf")! as URL,options:[:],completionHandler: nil)
    }
    

    @IBAction func OpenSecondBook(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "http://www.geeksforgeeks.com")! as URL,options:[:],completionHandler: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func openThirdBook(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.pdfbooksworld.com/Our-Vanishing-Wild-Life-Its-Extermination-and-Preservation")! as URL,options:[:],completionHandler: nil)
    }
}
