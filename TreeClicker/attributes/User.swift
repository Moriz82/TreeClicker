//
//  User.swift
//  TreeClicker
//
//  Created by Zachary Bauman on 4/18/22.
//

import Foundation
import UIKit

public class User {
    static var Money:Int;
    static var currAxe:Axe;
    static var currTree:Tree;
    
    private static let filename:String = "userdata";

    static func saveUser() {
        JSONSerialization.save(jsonObject: self, filename: filename);
    }

    static func loadUser() {
        var userdata = JSONSerialization.loadJSON(filename: filename);
        self.Money = Money;
        self.currAxe = currAxe;
        self.currTree = currTree;
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
