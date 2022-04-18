//
//  Axe.swift
//  TreeClicker
//
//  Created by Zachary Bauman on 4/18/22.
//

import Foundation
import UIKit

class Axe{
    let Name:String
    let Chops:Int
    let Color:UIColor
    
    init(Name:String,Chops:Int,Color:UIColor){
        self.Name=Name
        self.Chops=Chops
        self.Color=Color
    }
    
    func get_name()->String{
        return Name
    }
    func get_chops()->Int{
        return Chops
    }
    func get_color()->UIColor{
        return Color
    }
}
