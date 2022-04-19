//
//  Upgrades.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/18/22.
//

import Foundation
import UIKit


public class Worker {
    public let wantedTicks:Int;
    public let moneyEarned:Int;
    public let cost:Int;
    public var lastTick:Double;
    public var count:Double;

    init (wantedTicks:Int, moneyEarned:Int, cost:Int, lastTick:Double, count:Double) {
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
        JSONSerialization.save(jsonObject: workers, filename: filename);
    }

    static func loadWorkers() {
        workers = JSONSerialization.loadJSON(filename: filename);
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