//
//  DataSavingManager.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/19/22.
//

import Foundation
import UIKit

struct DataKeys {
    static let moneyKey:String = "0.0";
    static let axeLevelKey:String = "0";
    static let treeLevelKey:String = "0";
    static let workerDicKey:String = "worker";
}

class DataSavingManager {
    public static func saveData(money:Double, axeLevel:Int, treeLevel:Int, workerDic:[String:Int]) {
        let defaults = UserDefaults.standard;
        defaults.setValue(money, forKey: DataKeys.moneyKey);
        defaults.setValue(axeLevel, forKey: DataKeys.axeLevelKey);
        defaults.setValue(treeLevel, forKey: DataKeys.treeLevelKey);
        
        var workerString:String = "";
        
        for (name, amount) in workerDic {
            workerString += "\(name):\(amount)~";
        }

        workerString = String(workerString.dropLast());
        defaults.setValue(workerString, forKey: DataKeys.workerDicKey)
    }
    
    public static func resetData() {
        User.Money = 0.0;
        User.currAxe = Axe(Name: "Dirt Axe", Damage: 10, Image: UIImage(), Level: 0, Cost:0);
        User.currTree = Tree(Name: "Dirt Tree", Health: 100, Worth: 10, Image: UIImage(), Level: 0, Cost: 0);
        var workerDic:[String:Int] = [:]
        for (name, worker) in Workers.workers {
            worker.count = 0;
            workerDic[name] = Int(worker.count);
        }
        saveData(money: User.Money, axeLevel: User.currAxe.Level, treeLevel: User.currTree.Level, workerDic: workerDic)
    }
    
    public static func loadData() {
        let defaults = UserDefaults.standard;
        if let moneyString = defaults.string(forKey: DataKeys.moneyKey) {
            User.Money = Double(moneyString)!;
        }
        if let axeLevelString = defaults.string(forKey: DataKeys.axeLevelKey) {
            User.currAxe = Axes.axes[Int(axeLevelString)!]!;
        }
        if let treeLevelString = defaults.string(forKey: DataKeys.treeLevelKey) {
            User.currTree = Trees.trees[Int(treeLevelString)!]!;
        }
        if let workerDicString = defaults.string(forKey: DataKeys.workerDicKey) {
            for string in workerDicString.components(separatedBy: "~") {
                let str:[String] = string.components(separatedBy: ":");
                Workers.workers[str[0]]!.count = Double(Int(str[1])!);
            }
        }
    }
}
