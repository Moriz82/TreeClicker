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
    
    @IBOutlet weak var TreeImage: UIImageView!
    
    @IBOutlet var MainView: UIView!
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var ProgressView: UIView!
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    @IBOutlet weak var NumNameLabel: UILabel!
    @IBOutlet weak var MoneyLabel: UILabel!
    @IBOutlet weak var TreeChoppedLabel: UILabel!
    //1,000,000
    var NumNames:[Double:String] = [3:"Thousand",6:"Million",9:"Billion",12:"Trillion",15:"Quadrillion",18:"Quintillion"]

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
        if BigNumber == 0{
            User.Money=1
            
            return
        }
        var ResNum = BigNumber
        var ResNumNam = ""
        
        for i in NumNames.keys{
          if(BigNumber/pow(10,i)>=1){
            
            ResNumNam = NumNames[i]!
            ResNum = BigNumber/pow(10, i)
          }
        }
        
            NumberLabel.text = "\(ResNum)"
            NameNumberLabel.text = "\(ResNumNam)"
    }
    
    
    @IBAction func ButtonTreeDown(_ sender: Any) {
        TreeImage.alpha = 0.8
    }
    
    @IBAction func TreeClicked(_ sender: Any) {
        TreeImage.alpha=1
        
        print(User.Money.exponent)
        
        let imageCont = self.TreeImage.bounds;
        let iWidth = imageCont.size.width;
        let iHeight:CGFloat = 644 * CGFloat(User.currTree.healthPercent)
        
        TreeImage.bounds = CGRect(x: TreeImage.frame.origin.x, y: TreeImage.frame.origin.y, width: iWidth, height: iHeight)

        
        User.hitTree()
    }
    
    func Update() { // Update method is ran every tick
        
        TreeImage.image = User.currTree.Image
        
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
        TreeChoppedLabel.text = "\(User.currTree.chopped)"
        
   //     healthLabel.text = "\(User.currTree.Health) / \(User.currTree.maxHealth)"
    }

}
