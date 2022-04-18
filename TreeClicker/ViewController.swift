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
        Workers.AddWorker("Chopper", new Worker(wantedTicks: 6, moneyEarned: 1, cost: 100, lastTick: 0, count: 0));
        Workers.AddWorker("Lumberjack", new Worker(wantedTicks: 24, moneyEarned: 20, cost: 1000, lastTick: 0, count: 0));
        Workers.AddWorker("Chainsaw", new Worker(wantedTicks: 48, moneyEarned: 300, cost: 3000, lastTick: 0, count: 0));
        Workers.AddWorker("WoodChipper", new Worker(wantedTicks: 50, moneyEarned: 96, cost: 10000, lastTick: 0, count: 0));
        Workers.AddWorker("WoodMill", new Worker(wantedTicks: 100, moneyEarned: 974, cost: 1000000, lastTick: 0, count: 0));
        Workers.AddWorker("WoodFactory", new Worker(wantedTicks: 1000, moneyEarned: 40000, cost: 50000000, lastTick: 0, count: 0));
        Workers.AddWorker("WoodComplex", new Worker(wantedTicks: 20, moneyEarned: 10000, cost: 9999999999999, lastTick: 0, count: 0));
        // Create Axes

		//Create Trees
		
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

