//
//  DataSavingManager.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/19/22.
//

import Foundation

class DataSavingManager {
    public static func saveData(money:Double, axeLevel:Int, treeLevel:Int, workerDic:[String:Int]) {
        var stringToSave:String = ""
        
        stringToSave += "\(money)~"
        stringToSave += "\(axeLevel)~"
        stringToSave += "\(treeLevel)~"
        for (name, amount) in workerDic {
            stringToSave += "\(name):\(amount)#"
        }
        String(stringToSave.dropLast())  
        
        let path = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask)[0].appendingPathComponent("data")

        if let stringData = stringToSave.data(using: .utf8) {
            try? stringData.write(to: path)
        }
    }
    public static func loadData() {

        if (!dataExists()) {return;}

        let path = FileManager.default.urls(for: .documentDirectory,
                                            in: .userDomainMask)[0].appendingPathComponent("data")
        do{
            let data:String = try String(contentsOf: path, encoding: .utf8)
            var i = 0;
            for str in data.components(separatedBy: "~"){
                if i == 0 {
                    User.Money = Double(str)!
                }else if i == 1 {
                    User.currAxe = Axes.axes[Int(str)!]!
                }else if i == 2 {
                    User.currTree = Trees.trees[Int(str)!]!
                }else if i == 3 {
                    for s in str.components(separatedBy: "#") {
                        let com = s.components(separatedBy: ":")
                        Workers.workers[com[0]]?.count = Double(com[1])!
                    }
                }
                i+=1;
            }
        }catch{}
    }

    private static func dataExists() -> Bool {
        let fm = FileManager.default;
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask);
        let url = urls.first;
        let fileURL:String = url!.appendingPathComponent("data").absoluteString;

        if fm.fileExists(atPath: fileURL) {
            return true;
        }
        return false;
    }
}
