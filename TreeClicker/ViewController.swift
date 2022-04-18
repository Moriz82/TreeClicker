//
//  ViewController.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/13/22.
//

import UIKit

class ViewController: UIViewController {

    let ticksPerSecond = 12;
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
        //tick storage
        tickStorage["Chopper"] = currTick;
        tickStorage["Lumberjack"] = currTick;
        tickStorage["Chainsaw"] = currTick;
        tickStorage["WoodChipper"] = currTick;
        tickStorage["WoodMill"] = currTick;
        tickStorage["WoodComplex"] = currTick;
        //upgrade storage
        upgradeStorage["Chopper"] = 1;
        upgradeStorage["Lumberjack"] = 0;
        upgradeStorage["Chainsaw"] = 0;
        upgradeStorage["WoodChipper"] = 0;
        upgradeStorage["WoodMill"] = 0;
        upgradeStorage["WoodComplex"] = 0;
    }

    func Update() { // Update method is ran every tick

        //Chopper
        if (currTick - tickStorage["Chopper"]! >= Chopper.wantedTicks) {
            tickStorage["Chopper"] = currTick;
            User.money += Chopper.moneyEarned * upgradeStorage["Chopper"];
        }
        //Luberjack
        if (currTick - tickStorage["Lumberjack"]! >= Lumberjack.wantedTicks) {
            tickStorage["Lumberjack"] = currTick;
            User.money += Lumberjack.moneyEarned * upgradeStorage["Lumberjack"];
        }
        //Chainsaw
        if (currTick - tickStorage["Chainsaw"]! >= Chainsaw.wantedTicks) {
            tickStorage["Chainsaw"] = currTick;
            User.money += Chainsaw.moneyEarned * upgradeStorage["Chainsaw"];
        }
        //Wood Chipper
        if (currTick - tickStorage["WoodChipper"]! >= WoodChipper.wantedTicks) {
            tickStorage["WoodChipper"] = currTick;
            User.money += WoodChipper.moneyEarned * upgradeStorage["WoodChipper"];
        }
        //Wood Mill
        if (currTick - tickStorage["WoodMill"]! >= WoodMill.wantedTicks) {
            tickStorage["WoodMill"] = currTick;
            User.money += WoodMill.moneyEarned * upgradeStorage["WoodMill"];
        }
        //Wood Factory
        if (currTick - tickStorage["WoodFactory"]! >= WoodFactory.wantedTicks) {
            tickStorage["WoodFactory"] = currTick;
            User.money += WoodFactory.moneyEarned * upgradeStorage["WoodFactory"];
        }
        //Wood Complex
        if (currTick - tickStorage["WoodComplex"]! >= WoodComplex.wantedTicks) {
            tickStorage["WoodComplex"] = currTick;
            User.money += WoodComplex.moneyEarned * upgradeStorage["WoodComplex"];
        }
        //Update money label
        
    }

}

