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
    static var currAxe:Axe = Axe(Name: "Dirt Axe", Damage: 10, Image: UIImage(), Level: 0, Cost:0)
    static var currTree:Tree = Tree(Name: "Dirt Tree", Health: 100, Worth: 10, Image: UIImage(), Level: 0)
    
    private static let filename:String = "userdata";

    public static func hitTree() {
        currTree.damageTree(damage: (currAxe.getDamage()));
    }
}
