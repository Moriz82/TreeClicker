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
    
    @IBOutlet weak var MenuPanel: UIScrollView!
    @IBOutlet var MainView: UIView!
    @IBOutlet weak var treeButton: UIButton!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var healthBar: UIImageView!
    
    var healthBarMaxSize:CGFloat = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        // Initiate Items
        ItemInit.initItems();
        healthBarMaxSize = healthBar.frame.size.width;
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
        isHidden = true;
        let vc = (self.storyboard!.instantiateViewController(withIdentifier: "ShopViewController") as? ShopViewController)!
        self.navigationController!.pushViewController( vc, animated: true)
    }
    @IBAction func prestigeButtonPressed(_ sender: Any) {
        MenuPanel.isHidden = true;
        let vc = (self.storyboard!.instantiateViewController(withIdentifier: "PrestigeViewController") as? PrestigeViewController)!
        self.navigationController!.pushViewController( vc, animated: true)
    }
    @IBAction func MenuButtonPressed(_ sender: Any) {
        if isHidden {
            MenuPanel.isHidden = false;
            isHidden = false;
        }else{
            MenuPanel.isHidden = true;
            isHidden = true;
        }
    }
    
    @IBAction func onTreeClicked(_ sender: UIButton) {
        User.hitTree();
    }
    @IBAction func restButtonClicked(_ sender: Any) {
        DataSavingManager.resetData()
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
        
        // Update Health Bar
        if ViewController.healthBarNeedUpdate {
            healthBar.frame.size = CGSize(width: healthBarMaxSize * User.currTree.healthPercent, height: healthBar.frame.size.height)
            ViewController.healthBarNeedUpdate = false;
        }
        
        healthLabel.text = "\(User.currTree.Health) / \(User.currTree.maxHealth)"
    }

}
