//
//  ViewController.swift
//  Neurognosis
//
//  Created by Yanying Huo on 3/30/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var rectangle: UIView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var neurognosisLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        //self.view.bringSubviewToFront(rectangle)
        rectangle.layer.cornerRadius = 50
        
        
    
//        button.layer.cornerRadius = 30
//        button.layer.backgroundColor = UIColor(red: 1, green: 0.796, blue: 0.467, alpha: 1).cgColor
//        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        button.layer.shadowOpacity = 1
//        button.layer.shadowRadius = 4
//        button.layer.shadowOffset = CGSize(width: 0, height: 4)
    
//        neurognosisLabel.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.05)
//        neurognosisLabel.layer.shadowRadius = 1
//        neurognosisLabel.layer.shadowOpacity = 1
//        neurognosisLabel.layer.shadowOffset = CGSize(width: 0, height: 4)

    }


}

