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
    static var currAxe:Axe = nil
    static var currTree:Tree = nil
    
    private static let filename:String = "userdata";

    static func saveUser() {
        do{
            try JSONSerialization.save(jsonObject: UserData(money:Int(Money), currAxeLevel: currAxe.Level, currTreeLevel: currTree.Level), toFilename: filename);
        }catch{}
    }

    static func loadUser() {
        do{
            let userdata:UserData = try JSONSerialization.loadJSON(withFilename: filename) as! UserData;
            Money = Double(userdata.Money);
            currAxe = Axes.axes[userdata.currAxeLevel]!;
            currTree = Trees.trees[userdata.currTreeLevel]!;
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

public class UserData : Codable  {
    var Money:Int;
    var currAxeLevel:Int;
    var currTreeLevel:Int;
    
    init(money:Int, currAxeLevel:Int, currTreeLevel:Int){
        self.Money = money;
        self.currAxeLevel = currAxeLevel;
        self.currTreeLevel = currTreeLevel;
    }
    
    private enum CodingKeys1: Int, CodingKey {
            case Money
    }
    
    private enum CodingKeys2: Int, CodingKey {
        case currAxeLevel
        case currTreeLevel
    }
    
    required public init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys1.self)
        let values2 = try decoder.container(keyedBy: CodingKeys2.self)
        Money = try values.decode(Int.self, forKey: .Money)
        currAxeLevel = try values2.decode(Int.self, forKey: .currAxeLevel)
        currTreeLevel = try values2.decode(Int.self, forKey: .currTreeLevel)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys1.self)
        var container2 = encoder.container(keyedBy: CodingKeys2.self)
        try container.encode(Money, forKey: .Money)
        try container2.encode(currAxeLevel, forKey: .currAxeLevel)
        try container2.encode(currTreeLevel, forKey: .currTreeLevel)
    }
}
