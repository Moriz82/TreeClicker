//
//  Axe.swift
//  TreeClicker
//
//  Created by Zachary Bauman on 4/18/22.
//

import Foundation
import UIKit

public class Axe {
    let Name:String
    let Damage:Int
    let Image:UIImage
    
    init(Name:String,Damage:Int,Image:UIImage){
        self.Name=Name
        self.Damage=Damage
        self.Image=Image
    }
    
    func get_Name()->String{
        return Name
    }
    func get_Damage()->Int{
        return Damage
    }
    func get_Image()->UIImage{
        return Image
    }
}

public class Axes {
    public static var axes : [Int : Axe] = [:];
    private static let filename:String = "axesdata";

    static func addAxe(level:Int, axe:Axe) {
        axes[level] = axe;
    }

    static func saveAxes() {
        JSONSerialization.save(jsonObject: axes, filename: filename);
    }

    static func loadAxes() {
        axes = JSONSerialization.loadJSON(filename: filename);
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
