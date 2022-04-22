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
    @IBOutlet weak var MenuPanel: UIScrollView!
    @IBOutlet var MainView: UIView!
    
    // MARK: TO BE DELETED!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var chopperLabel: UILabel!
    @IBOutlet weak var axeLabel: UILabel!
    @IBAction func moneyButton(_ sender: Any) { User.Money += 1; }
    @IBAction func shopButtonClicl(_ sender: Any) { Workers.workers["Chopper"]!.count += 1; }
    // MARK: ^^^^^^^^^^^^^^
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Initiate Items
        ItemInit.initItems();
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
    @IBAction func shopButtonPressed(_ sender: Any) {
        MenuPanel.isHidden = true;
        let vc = (self.storyboard!.instantiateViewController(withIdentifier: "ShopViewController") as? ShopViewController)!
        self.navigationController!.pushViewController( vc, animated: true)
    }
    var isHidden = true;
    @IBAction func MenuButtonPressed(_ sender: Any) {
        if isHidden {
            MenuPanel.isHidden = false;
            isHidden = false;
        }else{
            MenuPanel.isHidden = true;
            isHidden = true;
        }
    }
    
    func Update() { // Update method is ran every tick

        // Check and update all workers
        for (_, worker) in Workers.workers {
            if (currTick - worker.lastTick >= worker.wantedTicks) {
                worker.lastTick = currTick;
                User.Money += worker.moneyEarned * worker.count;
            }
        }

        // Update money label
        moneyLabel.text = "Money : \(User.Money)";
        moneyLabel.sizeToFit();
        chopperLabel.text = "Chopper count : \(Workers.workers["Chopper"]!.count)"
        chopperLabel.sizeToFit()
        axeLabel.text = "\(User.currAxe.Name)"
        axeLabel.sizeToFit()
    }

}
