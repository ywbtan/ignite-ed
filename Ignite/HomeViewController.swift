//
//  HomeViewController.swift
//  Ignite
//
//  Created by Jun on 31/01/2021.
//

import UIKit

class HomeViewController: UIViewController,UIGestureRecognizerDelegate {

    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var search: UIView!
    @IBOutlet weak var orangeview: UIView!
    @IBOutlet weak var geo: UIView!
    @IBOutlet weak var math: UIView!
    @IBOutlet weak var cardView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        border(view: orangeview);
        border(view: sideView)
        
        whiteView.clipsToBounds = true
        whiteView.layer.cornerRadius = 32
        whiteView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
        cardView.layer.cornerRadius = 10
        math.layer.cornerRadius = 10
        geo.layer.cornerRadius = 10
        search.layer.cornerRadius = 10
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped(sender:)))
        tap.delegate = self as! UIGestureRecognizerDelegate
        cardView.addGestureRecognizer(tap)
    }
    
    @objc func viewTapped(sender : UITapGestureRecognizer) {
    print("You press me for what")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "ViewController")
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func border (view: UIView) {
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
    }
}

