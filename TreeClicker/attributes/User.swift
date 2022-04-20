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
    static var currAxe:Axe = Axe(Name: "Dirt Axe", Damage: 10, Image: UIImage(), Level: 0)
    static var currTree:Tree = Tree(Name: "Dirt Tree", Health: 100, Worth: 10, Image: UIImage(), Level: 0)
    
    private static let filename:String = "userdata";

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
