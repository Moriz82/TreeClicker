//
//  PrestigeViewController.swift
//  TreeClicker
//
//  Created by Zachary Bauman on 4/25/22.
//

import UIKit

class PrestigeViewController: UIViewController {
    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var treeLabel: UILabel!
    
    var currTreeNum=0
    
    override func viewDidLoad() {
        refresh();
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func refresh(){
        treeImage.image=Trees.trees[currTreeNum]!.Image
        treeLabel.text="\(Trees.trees[currTreeNum]!.Name)"
        costLabel.text="$\(Trees.trees[currTreeNum]!.Cost)"
        
    }
    
    @IBAction func backTreeButtonPressed(_ sender: Any) {
        if(currTreeNum != 0){
            currTreeNum-=1;
        }
        else{
            currTreeNum=Trees.trees.count-1
        }
        refresh()
    }
    @IBAction func nextTreeButtonPressed(_ sender: Any) {
        if(Trees.trees.count-1 > currTreeNum){
            currTreeNum+=1;
        }
        else{
            currTreeNum=0;
        }
        refresh()
    }
    @IBAction func purchaseTreeButtonPressed(_ sender: Any) {
        if (Int(User.Money) >= Trees.trees[currTreeNum]!.Cost){
            DataSavingManager.resetData()
            User.currTree = Trees.trees[currTreeNum]!
            User.message = "\(Trees.trees[currTreeNum]!.Name) Bought Successfully"
        }
        else {User.message = "Not Enough Money!"}
        let vc = (storyboard!.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController)!
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
