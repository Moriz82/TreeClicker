//
//  PrestigeViewController.swift
//  TreeClicker
//
//  Created by Zachary Bauman on 4/25/22.
//

import UIKit

class PrestigeViewController: UIViewController {

    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    var currTreeNum=0
    override func viewDidLoad() {
        refresh();
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func refresh(){
        treeImage.image=Trees.trees[currTreeNum]!.Image
        valueLabel.text="\(User.currTree.Worth) -> \(Trees.trees[currTreeNum]!)"
        costLabel.text="$\(Trees.trees[currTreeNum]!.Cost)"
        
    }
    
    @IBAction func backTreeButtonPressed(_ sender: Any) {
        if(Trees.trees.count < currTreeNum){
            currTreeNum-=1;
        }
        else{
            currTreeNum=Trees.trees.count
        }
        refresh()
    }
    @IBAction func nextTreeButtonPressed(_ sender: Any) {
        if(Trees.trees.count > currTreeNum){
            currTreeNum+=1;
        }
        else{
            currTreeNum=0;
        }
        refresh()
    }
    @IBAction func purchaseTreeButtonPressed(_ sender: Any) {
    }
    @IBAction func prestigeBackButtonPressed(_ sender: Any) {
        self.navigationController!.popViewController(animated: true)
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
