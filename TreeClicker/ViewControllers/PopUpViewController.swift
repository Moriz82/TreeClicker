//
//  PopUpViewController.swift
//  TreeClicker
//
//  Created by William Dedominico on 5/10/22.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageLabel.text = User.message
    }

    @IBAction func onBackPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
