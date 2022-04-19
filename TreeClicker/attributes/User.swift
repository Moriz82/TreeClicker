//
//  User.swift
//  TreeClicker
//
//  Created by Zachary Bauman on 4/18/22.
//

import Foundation
import UIKit

public class User {
    static var Money:Double = 0;
    static var currAxe:Axe = Axes.axes[0]!
    static var currTree:Tree = Trees.trees[0]!;
    
    private static let filename:String = "userdata";

    static func saveUser() {
        do{
            try JSONSerialization.save(jsonObject: UserData(money:Int(Money), currAxe: currAxe, currTree: currTree), toFilename: filename);
        }catch{}
    }

    static func loadUser() {
        do{
            let userdata:UserData = try JSONSerialization.loadJSON(withFilename: filename) as! UserData;
        Money = userdata.Money;
            currAxe = userdata.currAxe;
            currTree = userdata.currTree;
        }
        catch{}
    }

    static func dataExists() -> Bool {
        let fm = FileManager.default;
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask);
        let url = urls.first;
        let fileURL = url!.appendingPathComponent(filename);
        let fileUrl:String = fileURL.appendingPathExtension("json").absoluteString;

        if fm.fileExists(atPath: fileUrl) {
            return true;
        }
        return false;
    }
}

public class UserData {
    var Money:Double = 0;
    var currAxe:Axe = Axes.axes[0]!
    var currTree:Tree = Trees.trees[0]!;
    
    init(money:Int, currAxe:Axe, currTree:Tree){
        self.Money = Double(money);
        self.currAxe = currAxe;
        self.currTree = currTree;
    }
}
