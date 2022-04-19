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

    static func AddTree(level:Int, tree:Tree) {
        trees[level] = tree;
    }

    static func saveTrees() {
        do{
            try JSONSerialization.save(jsonObject: trees, toFilename: filename);
        }catch{}
    }

    static func loadTrees() {
        do {
            try trees = JSONSerialization.loadJSON(withFilename: filename) as! [Int : Tree];
        }catch{}
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
