//
//  ShopViewController.swift
//  TreeClicker
//
//  Created by Zachary Bauman on 4/21/22.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var axeItemLabel: UILabel!
    @IBOutlet weak var axeItemButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // display axes
        var axeLabel:UILabel = axeItemLabel;
        var axeButton:UIButton = axeItemButton;
        
        for i in 0...Axes.axes.count-1 {
            let axe = Axes.axes[i]!
            axeLabel.text = "\(axe.Name), Level: \(axe.Level), Damage: \(axe.Damage)"
            axeButton.tag = axe.Level;
            axeButton.addTarget(self, action: #selector(buyButtonAction), for: .touchUpInside)
            if i != Axes.axes.count-1 {
                let oldLabel:CGPoint = axeLabel.frame.origin;
                let oldButton:CGPoint = axeButton.frame.origin;
                axeLabel = axeLabel.createCopy();
                axeButton = axeButton.createCopy();
                let newPositionLabel:CGPoint = CGPoint(x: oldLabel.x, y: oldLabel.y + 30);
                let newPositionButton:CGPoint = CGPoint(x: oldLabel.x, y: oldLabel.y + 30);
//                tableCom.frame.origin = newPosition;
//                tableCom.
//                tableCom.isHidden = false;
//                axeStackView.addSubview(tableCom)
            }
        }
    }    
    @IBAction func onBackClicked(_ sender: UIButton) {
        self.navigationController!.popViewController(animated: true)
    }
    
    @objc func buyButtonAction(sender: UIButton!) {
        let btnsendtag: UIButton = sender;
        let selectedAxe:Axe = Axes.axes[btnsendtag.tag]!;
        if (User.Money >= Double(selectedAxe.Cost)) {
            User.Money -= Double(selectedAxe.Cost);
            User.currAxe = selectedAxe;
        }
    }
    

}

extension UILabel {
    func createCopy() -> UILabel {
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: self)
        return NSKeyedUnarchiver.unarchiveObject(with: archivedData) as! UILabel
    }
}

extension UIButton {
    func createCopy() -> UIButton {
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: self)
        return NSKeyedUnarchiver.unarchiveObject(with: archivedData) as! UIButton
    }
}
