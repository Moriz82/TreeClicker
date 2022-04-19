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

    init (wantedTicks:Double, moneyEarned:Double, cost:Int, lastTick:Double, count:Double) {
        self.wantedTicks = wantedTicks;
        self.moneyEarned = moneyEarned;
        self.cost = cost;
        self.lastTick = lastTick;
        self.count = count;
    }
}

public class Workers {
    public static var workers : [String : Worker] = [:];
    private static let filename:String = "workersdata";

    static func AddWorker(name:String, worker:Worker) {
        workers[name] = worker;
    }

    static func saveWorkers() {
        do{
            try JSONSerialization.save(jsonObject: workers, toFilename: filename);
        }catch{}
    }

    static func loadWorkers() {
        do{
            try workers = JSONSerialization.loadJSON(withFilename: filename) as! [String : Worker];
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
