//
//  ViewController3.swift
//  Test
//
//  Created by Yanying Huo on 4/1/22.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    var index = 0

    static func getInstance(index: Int) -> ViewController3 {
      let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController3") as! ViewController3
      vc.index = index
      return vc
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      titleLabel.text = "(Page \(index))"
      view.backgroundColor = index % 2 == 0 ? .systemBlue : .systemGreen
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