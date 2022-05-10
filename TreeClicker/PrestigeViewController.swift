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
        DataSavingManager.resetData()
        User.currTree = Trees.trees[currTreeNum]!
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
