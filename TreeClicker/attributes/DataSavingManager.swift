//
//  DataSavingManager.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/19/22.
//

import Foundation

struct DataKeys {
    static let moneyKey:String = "";
    static let axeLevelKey:String = "";
    static let treeLevelKey:String = "";
    static let workerDicKey:String = "";
}

class DataSavingManager {
    public static func saveData(money:Double, axeLevel:Int, treeLevel:Int, workerDic:[String:Int]) {
        
        let defaults = UserDefaults.standard;
        defaults.set(money, forKey: DataKeys.moneyKey);
        defaults.set(axeLevel, forKey: DataKeys.axeLevelKey);
        defaults.set(treeLevel, forKey: DataKeys.treeLevelKey);
        
        var workerString:String = "";
        
        for (name, amount) in workerDic {
            workerString += "\(name):\(amount)~";
        }
        workerString = String(workerString.dropLast());
        defaults.set(workerString, forKey: DataKeys.workerDicKey)
        
    }
    public static func loadData() {
        let defaults = UserDefaults.standard;
        if let moneyString = defaults.string(forKey: DataKeys.moneyKey) {
            User.Money = Double(moneyString)!
        }
        if let axeLevelString = defaults.string(forKey: DataKeys.axeLevelKey) {
            User.currAxe = Axes.axes[Int(axeLevelString)!]!
        }
        if let treeLevelString = defaults.string(forKey: DataKeys.treeLevelKey) {
            User.currTree = Trees.trees[Int(treeLevelString)!]!
        }
        if let workerDicString = defaults.string(forKey: DataKeys.workerDicKey) {
            for string in workerDicString.components(separatedBy: "~") {
                let str:[String] = string.components(separatedBy: ":");
                
            }
        }
    }
}
