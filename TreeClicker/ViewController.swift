//
//  ViewController.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/13/22.
//

import UIKit

class ViewController: UIViewController {

    let ticksPerSecond:Int = 12;
    var currTick:Double = 0;
    var currSecond:Double = 0;
    var timer = Timer();

    override func viewDidLoad() {
        super.viewDidLoad();
        // Create Workers
        Workers.AddWorker(name: "Chopper", worker: Worker(wantedTicks: 6, moneyEarned: 1, cost: 100, lastTick: 0, count: 0));
        Workers.AddWorker(name: "Lumberjack", worker: Worker(wantedTicks: 24, moneyEarned: 20, cost: 1000, lastTick: 0, count: 0));
        Workers.AddWorker(name: "Chainsaw", worker: Worker(wantedTicks: 2, moneyEarned: 5, cost: 3000, lastTick: 0, count: 0));
        Workers.AddWorker(name: "WoodChipper", worker: Worker(wantedTicks: 50, moneyEarned: 96, cost: 10000, lastTick: 0, count: 0));
        Workers.AddWorker(name: "WoodMill", worker: Worker(wantedTicks: 100, moneyEarned: 974, cost: 1000000, lastTick: 0, count: 0));
        Workers.AddWorker(name: "WoodFactory", worker: Worker(wantedTicks: 1000, moneyEarned: 40000, cost: 50000000, lastTick: 0, count: 0));
        Workers.AddWorker(name: "WoodComplex", worker: Worker(wantedTicks: 20, moneyEarned: 10000, cost: 9999999999999, lastTick: 0, count: 0));
        // Create Axes
        Axes.addAxe(level: 0, axe: Axe(Name: "Wooden Axe", Damage: 10, Image: UIImage(), Level: 0));
        // Create Trees
        Trees.AddTree(level: 0, tree: Tree(Name: "Dirt Tree", Health: 100, Worth: 10, Image: UIImage(), Level: 0));
        // Load Data
        DataSavingManager.loadData();
        // Timer for updating based on defined tick rate
        self.timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(0.12), repeats: true, block: { _ in
            self.Update();
            self.currTick += 1;
            self.currSecond = self.currTick / Double(self.ticksPerSecond);
        });
    }

    func Update() { // Update method is ran every tick

        // Check and update all workers

        for (_, worker) in Workers.workers {
            if (currTick - worker.lastTick >= worker.wantedTicks) {
                worker.lastTick = currTick;
                User.Money += worker.moneyEarned * worker.count;
            }
        }

        // Update money label
        
    }

}
