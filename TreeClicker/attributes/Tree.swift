//
//  Tree.swift
//  TreeClicker
//
//  Created by Zachary Bauman on 4/18/22.
//

import Foundation
import UIKit

public class Tree {
    let Name:String
    let maxHealth:Int
    var Health:Int
    let Worth:Int
    let Image:UIImage
    let Level:Int
    let Cost:Int
    var healthPercent:Float
    var chopped:Int
    
    init(Name:String, Health:Int, Worth:Int, Image:UIImage,Level:Int,Cost:Int){
        self.Name=Name
        self.Health=Health
        self.Worth=Worth
        self.Image=Image
        self.Level=Level
        self.maxHealth = Health;
        self.healthPercent = 1;
        self.Cost=Cost
        chopped = 0
    }
    func getName() -> String {
        return Name;
    }
    func getHealth() -> Int {
        return Health;
    }
    func getWorth() -> Int {
        return Worth;
    }
    func getImage() -> UIImage {
        return Image;
    }
    func setHealth(health:Int) {
        Health = health;
    }
    func damageTree(damage:Int) {
        Health -= damage;
        if Health <= 0 {
            User.Money += Double(Worth);
            Health = maxHealth;
            healthPercent = 1;
            chopped += 1
        }
        healthPercent = (Float(Health) / Float(maxHealth));
        ViewController.healthBarNeedUpdate = true;
    }
}

public class Trees {
    public static var trees : [Int : Tree] = [:];
    private static let filename:String = "treesdata";
    
    static func AddTree(level:Int, tree:Tree) {
        trees[level] = tree;
    }
}
