//
//  Tree.swift
//  TreeClicker
//
//  Created by Zachary Bauman on 4/18/22.
//

import Foundation
import UIKit

public class Tree{
    let Name:String
    var Health:Int
    let Worth:Int
    let Image:UIImage
    
    init(Name:String,Health:Int,Worth:Int,Image:UIImage){
        self.Name=Name
        self.Health=Health
        self.Worth=Worth
        self.Image=Image
    }
    func get_Name()->String{
        return Name
    }
    func get_Health()->Int{
        return Health
    }
    func get_Worth()->Int{
        return Worth
    }
    func get_Image()->UIImage{
        return Image
    }
    func set_Health(Health:Int){
        self.Health=Health
    }
}
