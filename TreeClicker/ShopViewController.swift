//
//  ShopViewController.swift
//  TreeClicker
//
//  Created by Zachary Bauman on 4/21/22.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var axeStackView: UIStackView!
    @IBOutlet weak var treeStackView: UIStackView!
    @IBOutlet weak var tableViewCom: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // display axes
        var tableCom:UITableViewCell = tableViewCom;
        for i in 0...Axes.axes.count-1 {
            let axe = Axes.axes[i]!
            for subView in tableCom.contentView.subviews {
                if let item = subView as? UILabel {
                    item.text = "\(axe.Name), Level: \(axe.Level), Damage: \(axe.Damage)"
                }
                if let item = subView as? UIButton {
                    item.tag = axe.Level;
                    item.addTarget(self, action: #selector(buyButtonAction), for: .touchUpInside)
                }
            }
            if i != Axes.axes.count-1 {
                let old:CGPoint = tableCom.frame.origin;
                tableCom = tableCom.createCopy();
                let newPosition:CGPoint = CGPoint(x: old.x, y: old.y + 30);
                tableCom.frame.origin = newPosition;
                tableCom.isHidden = false;
                axeStackView.addSubview(tableCom)
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

extension UITableViewCell {
    func createCopy() -> UITableViewCell {
        let archivedData = NSKeyedArchiver.archivedData(withRootObject: self)
        return NSKeyedUnarchiver.unarchiveObject(with: archivedData) as! UITableViewCell
    }
}
