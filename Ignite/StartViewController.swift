//
//  StartViewController.swift
//  Ignite
//
//  Created by Jun on 31/01/2021.
//

import UIKit

class StartViewController: UIViewController {


    @IBOutlet weak var start_button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        start_button.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
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
