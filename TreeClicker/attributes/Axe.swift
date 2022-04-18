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
