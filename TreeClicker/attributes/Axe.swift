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
        do{
            try JSONSerialization.save(jsonObject: axes, toFilename: filename);
        }catch{}
    }

    static func loadAxes() {
        do{
            try axes = JSONSerialization.loadJSON(withFilename: filename) as! [Int : Axe];
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
