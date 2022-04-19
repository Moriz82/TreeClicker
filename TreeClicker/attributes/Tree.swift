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
    var Health:Int
    let Worth:Int
    let Image:UIImage
    let Level:Int
    
    init(Name:String, Health:Int, Worth:Int, Image:UIImage,Level:Int){
        self.Name=Name
        self.Health=Health
        self.Worth=Worth
        self.Image=Image
        self.Level=Level
    }
    func get_Name() -> String {
        return Name;
    }
    func get_Health() -> Int {
        return Health;
    }
    func get_Worth() -> Int {
        return Worth;
    }
    func get_Image() -> UIImage {
        return Image;
    }
    func set_Health(Health:Int) {
        self.Health = Health;
    }
}


public class Trees {
    public static var trees : [Int : Tree] = [:];
    private static let filename:String = "treesdata";

    static func AddTree(level:Int, tree:Tree) {
        trees[level] = tree;
    }
}
