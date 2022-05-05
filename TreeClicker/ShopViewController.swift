//
//  ShopViewController.swift
//  TreeClicker
//
//  Created by Zachary Bauman on 4/21/22.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var labelView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelView.layer.cornerRadius = 11;
        self.view.layer.cornerRadius = 30;
        // display axes
        
    }
    
    @IBAction func onExitButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
