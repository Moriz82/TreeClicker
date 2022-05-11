//
//  Upgrades.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/18/22.
//

import Foundation
import UIKit


public class Worker {
    public let wantedTicks:Double;
    public let moneyEarned:Double;
    public let cost:Int;
    public var lastTick:Double;
    public var count:Double;
    public let Image:UIImage

    init (wantedTicks:Double, moneyEarned:Double, cost:Int, lastTick:Double, count:Double, Image:UIImage) {
        self.wantedTicks = wantedTicks;
        self.moneyEarned = moneyEarned;
        self.cost = cost;
        self.lastTick = lastTick;
        self.count = count;
        self.Image = Image;
    }
}

public class Workers {
    public static var workers : [String : Worker] = [:];
    private static let filename:String = "workersdata";

    static func AddWorker(name:String, worker:Worker) {
        workers[name] = worker;
    }
}
