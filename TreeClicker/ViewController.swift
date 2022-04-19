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
        if (!Workers.dataExists()) {
            Workers.AddWorker("Chopper", Worker(wantedTicks: 6, moneyEarned: 1, cost: 100, lastTick: 0, count: 0));
            Workers.AddWorker("Lumberjack", Worker(wantedTicks: 24, moneyEarned: 20, cost: 1000, lastTick: 0, count: 0));
            Workers.AddWorker("Chainsaw", Worker(wantedTicks: 2, moneyEarned: 5, cost: 3000, lastTick: 0, count: 0));
            Workers.AddWorker("WoodChipper", Worker(wantedTicks: 50, moneyEarned: 96, cost: 10000, lastTick: 0, count: 0));
            Workers.AddWorker("WoodMill", Worker(wantedTicks: 100, moneyEarned: 974, cost: 1000000, lastTick: 0, count: 0));
            Workers.AddWorker("WoodFactory", Worker(wantedTicks: 1000, moneyEarned: 40000, cost: 50000000, lastTick: 0, count: 0));
            Workers.AddWorker("WoodComplex", Worker(wantedTicks: 20, moneyEarned: 10000, cost: 9999999999999, lastTick: 0, count: 0));
        }
        // Create Axes
        if (!Axes.dataExists()) {
            Axes.addAxe(0, Axe(Name: "Wooden Axe", Damage: 10, Image: nil));
        }
		// Create Trees
		if (!Trees.dataExists()) {
            Trees.addTree(0, Tree(Name: "Dirt Tree", Health: 100, Worth: 10, Image: nil));
        }
        // Create User
        if (!User.dataExists()) {
            User.Money = 0;
            User.currAxe = Axes.axes[0];
            User.currTree = Trees.trees[0];
        }
        // Load Workers
        Workers.loadWorkers();
        // Load Axes
        Axes.loadAxes();
        // Load Trees
        Trees.loadTrees();
        // Load User
        User.loadUser();
		// Timer for updating based on defined tick rate
        self.timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(0.12), repeats: true, block: { _ in
            self.Update();
            self.currTick += 1;
            self.currSecond = self.currTick / self.ticksPerSecond;
        });
    }

    func Update() { // Update method is ran every tick

        // Check and update all workers

        for (name, worker) in Workers.workers {
            if (currTick - worker.lastTick >= worker.wantedTicks) {
                worker.lastTick = currTick;
                User.money += worker.moneyEarned * worker.count;
            }
        }

        // Update money label
        
    }

}
