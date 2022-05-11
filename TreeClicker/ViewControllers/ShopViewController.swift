//
//  ShopViewController.swift
//  TreeClicker
//
//  Created by Zachary Bauman on 4/21/22.
//

import UIKit

class ShopViewController: UIViewController {

    @IBOutlet weak var labelView: UIView!
    
    @IBOutlet weak var axeImage: UIImageView!
    @IBOutlet weak var axeNameLabel: UILabel!
    @IBOutlet weak var axeDamageLabel: UILabel!
    
    var currAxeNumber = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelView.layer.cornerRadius = 11;
        self.view.layer.cornerRadius = 30;
        refresh()
    }
    
    func refresh(){
        axeImage.image=Axes.axes[currAxeNumber]!.Image
        axeNameLabel.text="\(Axes.axes[currAxeNumber]!.Name) $\(Axes.axes[currAxeNumber]!.Cost)"
        axeDamageLabel.text="Damage : \(Axes.axes[currAxeNumber]!.Damage)"
    }
    
    
    @IBAction func onExitButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func leftNavigationButton(_ sender: Any) {
        if(currAxeNumber != 0){
            currAxeNumber-=1;
        }
        else{
            currAxeNumber=Trees.trees.count-1
        }
        refresh()
    }
    
    @IBAction func rightNavigationButton(_ sender: Any) {
        if(Trees.trees.count-1 > currAxeNumber){
            currAxeNumber+=1;
        }
        else{
            currAxeNumber=0;
        }
        refresh()
    }
    
    @IBAction func buyButtonPressed(_ sender: Any) {
        if (Axes.axes[currAxeNumber]!.Cost <= Int(User.Money)) {
            User.Money -= Double(Axes.axes[currAxeNumber]!.Cost);
            User.currAxe = Axes.axes[currAxeNumber]!;
            User.message = "\(User.currAxe.Name) Bought Successfully"
        }
        else {User.message = "Not Enough Money!"}
        let vc = (storyboard!.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController)!
        self.present(vc, animated: true, completion: nil)
    }
}
