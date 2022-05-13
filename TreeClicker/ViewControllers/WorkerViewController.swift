//
//  WorkerViewController.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/29/22.
//

import UIKit

class WorkerViewController: UIViewController {
    
    @IBOutlet weak var labelView: UIView!
    @IBOutlet weak var workerImage: UIImageView!
    @IBOutlet weak var workerNameLabel: UILabel!
    @IBOutlet weak var costLabel: UILabel!
    @IBOutlet weak var amountSlider: UISlider!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var amountTextBox: UITextField!
    
    var currWorkerName = "";
    var workerIndex = 0;
    var amount:Float = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelView.layer.cornerRadius = 11;
        self.view.layer.cornerRadius = 30;
        refresh()
        amountSlider.value = amount
        // Do any additional setup after loading the view.
    }
    
    func refresh(){
        
        var i = 0;
        for (name, _) in Workers.workers {
            if (workerIndex == i) {
                currWorkerName = name;
                break;
            }
            i += 1;
        }
        
        workerImage.image=Workers.workers[currWorkerName]!.Image
        workerNameLabel.text="\(currWorkerName)  $\(Float(Workers.workers[currWorkerName]!.cost) * amount)"
        amountLabel.text = "Amount : \(amount)"
        costLabel.text = "Total : \(Workers.workers[currWorkerName]!.count)"
        amountTextBox.text = "\(amount)"
    }

    @IBAction func onSliderValueChange(_ sender: Any) {
        (sender as AnyObject).setValue((sender as AnyObject).value.rounded(.down), animated: true)
        amount = amountSlider.value;
        amountLabel.text = "Amount : \(amount)"
        refresh()
    }
    
    @IBAction func contentChanged(_ sender: Any) {
        amount = Float(amountTextBox.text!)!
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func leftButtonClicked(_ sender: Any) {
        if(workerIndex != 0){
            workerIndex-=1;
        }
        else{
            workerIndex = Workers.workers.count-1
        }
        refresh()
    }
    
    @IBAction func rightButtonClicked(_ sender: Any) {
        if(Workers.workers.count-1 > workerIndex){
            workerIndex+=1;
        }
        else{
            workerIndex=0;
        }
        refresh()
    }
    
    @IBAction func buyButtonClicked(_ sender: Any) {
        if (Int(User.Money) >= Workers.workers[currWorkerName]!.cost * Int(amount)) {
            User.Money -= Double(Workers.workers[currWorkerName]!.cost) * Double(amount);
            Workers.workers[currWorkerName]!.count += Double(amount);
            workerNameLabel.text="\(currWorkerName)  $\(Workers.workers[currWorkerName]!.cost)"
            User.message = "\(currWorkerName) Bought Successfully"
        }
        else {User.message = "Not Enough Money!"}
        let vc = (storyboard!.instantiateViewController(withIdentifier: "PopUpViewController") as? PopUpViewController)!
        self.present(vc, animated: true, completion: nil)
    }
}
