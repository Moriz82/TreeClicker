//
//  DataSavingManager.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/19/22.
//

import Foundation

struct DataKeys {
    static let moneyKey:String = "0.0";
    static let axeLevelKey:String = "0";
    static let treeLevelKey:String = "0";
    static let workerDicKey:String = "worker";
}

class DataSavingManager {
    public static func saveData(money:Double, axeLevel:Int, treeLevel:Int, workerDic:[String:Int]) {
        print("Started Saving Data");
        let defaults = UserDefaults.standard;
        defaults.setValue(money, forKey: DataKeys.moneyKey);
        print("Saved Money  1/4");
        defaults.setValue(axeLevel, forKey: DataKeys.axeLevelKey);
        print("Saved Axe  2/4");
        defaults.setValue(treeLevel, forKey: DataKeys.treeLevelKey);
        print("Saved Tree  3/4");
        
        var workerString:String = "";
        
        for (name, amount) in workerDic {
            workerString += "\(name):\(amount)~";
        }

        workerString = String(workerString.dropLast());
        defaults.setValue(workerString, forKey: DataKeys.workerDicKey)
        print("Saved Workers 4/4");
        print("Finished Saving");
    }
    public static func loadData() {
        print("Started Loading Data");
        let defaults = UserDefaults.standard;
        if let moneyString = defaults.string(forKey: DataKeys.moneyKey) {
            print(moneyString)
            User.Money = Double(moneyString)!;
            print("Loaded Money 1/4");
        }
        if let axeLevelString = defaults.string(forKey: DataKeys.axeLevelKey) {
            User.currAxe = Axes.axes[Int(axeLevelString)!]!;
            print("Loaded Axe 2/4");
        }
        if let treeLevelString = defaults.string(forKey: DataKeys.treeLevelKey) {
            User.currTree = Trees.trees[Int(treeLevelString)!]!;
            print("Loaded Tree 3/4");
        }
        if let workerDicString = defaults.string(forKey: DataKeys.workerDicKey) {
            for string in workerDicString.components(separatedBy: "~") {
                let str:[String] = string.components(separatedBy: ":");
                Workers.workers[str[0]]!.count = Double(Int(str[1])!);
            }
            print("Loaded Workers 4/4");
        }
        print("Finished Loading\n");
    }
}
