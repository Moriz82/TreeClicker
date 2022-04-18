//
//  ViewController.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/13/22.
//

import UIKit

class ViewController: UIViewController {

    let ticksPerSecond = 12;
    var money = 0;
    var currTick = 0;
    var currSecond = 0;
    var tickStorage : [String: Int] = [:]
    var upgradeStorage : [String: Int] = [:]
    var timer = Timer();

    override func viewDidLoad() {
        super.viewDidLoad();
        // Timer for updating based on defined tick rate
        self.timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(0.12), repeats: true, block: { _ in
            self.Update();
            self.currTick += 1;
            self.currSecond = self.currTick / self.ticksPerSecond;
        });
        
        //Initilize dicinarys
        tickStorage["Chopper"] = currTick;
        tickStorage["Lumberjack"] = currTick;
        tickStorage["Chainsaw"] = currTick;
        tickStorage["WoodChipper"] = currTick;
        tickStorage["WoodMill"] = currTick;
        tickStorage["WoodComplex"] = currTick;
    }

    func Update() { // Update method is ran every tick

        //Chopper

        if (currTick - tickStorage["Chopper"]! >= Chopper.wantedTicks) {
            tickStorage["Chopper"] = currTick;
            money += Chopper.moneyEarned;
        }
        //Luberjack

        //Chainsaw

        //Wood Chipper

        //Wood Mill

        //Wood Factory

        //Wood Complex

        
        //Update money label
        
    }

}

