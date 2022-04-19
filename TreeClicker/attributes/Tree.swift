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
    
    init(Name:String, Health:Int, Worth:Int, Image:UIImage){
        self.Name=Name
        self.Health=Health
        self.Worth=Worth
        self.Image=Image
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

    static func AddWorker(level:Int, tree:Tree) {
        trees[level] = tree;
    }

    static func saveTrees() {
        JSONSerialization.save(jsonObject: trees, filename: filename);
    }

    static func loadTrees() {
        trees = JSONSerialization.loadJSON(filename: filename);
    }

    static func dataExists() -> Bool {
        let fm = FileManager.default;
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask);
        let url = urls.first;
        var fileURL = url.appendingPathComponent(filename);
        fileURL = fileURL.appendingPathExtension("json");

        if fm.fileExists(atPath: fileURL) {
            return true;
        }
        return false;
    }
}