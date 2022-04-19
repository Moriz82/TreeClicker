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
    let Level:Int
    
    init(Name:String,Damage:Int,Image:UIImage,Level:Int){
        self.Name=Name
        self.Damage=Damage
        self.Image=Image
        self.Level=Level
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
}
