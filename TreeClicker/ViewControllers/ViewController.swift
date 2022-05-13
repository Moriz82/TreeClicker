//
//  ViewController.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/13/22.
//

import UIKit

class ViewController: UIViewController {

    let ticksPerSecond:Int = 12;
    var currTick:Double = 0;
    var currSecond:Double = 0;
    var timer = Timer();
    var isHidden = true;
    
    static var healthBarNeedUpdate = false;
    
    @IBOutlet var MainView: UIView!
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var ProgressView: UIView!
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    @IBOutlet weak var MoneyByWorkersLabel: UILabel!
    @IBOutlet weak var NumNameLabel: UILabel!
    @IBOutlet weak var MoneyLabel: UILabel!
    @IBOutlet weak var TreeChoppedLabel: UILabel!
    //1,000,000,000
    let NumName:[String] = ["Thousand","Million","Billion","Trillion","Quadrillion","Quintillion"]
        
    override func viewDidLoad() {
        super.viewDidLoad();
        // Initiate Items
        ItemInit.initItems();
        TopView.layer.cornerRadius=30
        ProgressView.layer.cornerRadius=15

        // Load Data
        DataSavingManager.loadData();
        // Timer for updating based on defined tick rate
        self.timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(0.12), repeats: true, block: { _ in
            self.Update();
            if (self.currTick >= Double.greatestFiniteMagnitude) { self.currTick = 0; }
            self.currTick += 1;
            self.currSecond = self.currTick / Double(self.ticksPerSecond);
        });
        // Timer for saving data automaticlly
        self.timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(100), repeats: true, block: { _ in
            var workersDic:[String:Int] = [:];
            for (name, worker) in Workers.workers {
                workersDic[name] = Int(worker.count);
            }
            DataSavingManager.saveData(money: User.Money, axeLevel: User.currAxe.Level, treeLevel: User.currTree.Level, workerDic: workersDic);
        });
    }
    func SetNumName(BigNumber:Double,NumberLabel:UILabel,NameNumberLabel:UILabel){
        var CurrName:String = ""
        var NumDec:Double=0
        for i in stride(from: 0, to: NumName.count-1, by: 1){
            if((i*3)+4 <= BigNumber.exponent-7){
                NumDec=Double(BigNumber.exponent-8)
                CurrName = NumName[i]
            }
        }
        NumberLabel.text = "\(BigNumber/(pow(10, NumDec)))"
        NameNumberLabel.text = CurrName
        
    }
    
    @IBAction func shopButtonPressed(_ sender: Any) {
      //  MenuPanel.isHidden = true;
        isHidden = true;
        let vc = (self.storyboard!.instantiateViewController(withIdentifier: "ShopViewController") as? ShopViewController)!
        self.navigationController!.pushViewController( vc, animated: true)
    }
    @IBAction func prestigeButtonPressed(_ sender: Any) {
     //   MenuPanel.isHidden = true;
        let vc = (self.storyboard!.instantiateViewController(withIdentifier: "PrestigeViewController") as? PrestigeViewController)!
        self.navigationController!.pushViewController( vc, animated: true)
    }
    @IBAction func MenuButtonPressed(_ sender: Any) {
        if isHidden {
       //     MenuPanel.isHidden = false;
            isHidden = false;
        }else{
       //     MenuPanel.isHidden = true;
            isHidden = true;
        }
    }
    
    @IBAction func TreeClicked(_ sender: Any) {
        User.hitTree()
    }
    
    func Update() { // Update method is ran every tick
        
        SetNumName(BigNumber: User.Money, NumberLabel: MoneyLabel, NameNumberLabel: NumNameLabel)
        
        // Update Health Bar
        ProgressBar.setProgress(User.currTree.healthPercent, animated: false)
    
        // Check and update all workers
        for (_, worker) in Workers.workers {
            if (currTick - worker.lastTick >= worker.wantedTicks) {
                worker.lastTick = currTick;
                User.Money += worker.moneyEarned * worker.count;
            }
        }
        
        // Update money label
        MoneyByWorkersLabel.text = ""
        TreeChoppedLabel.text = "\(User.currTree.chopped)"
        
   //     healthLabel.text = "\(User.currTree.Health) / \(User.currTree.maxHealth)"
    }

}
