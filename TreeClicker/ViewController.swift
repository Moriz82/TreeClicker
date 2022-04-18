//
//  ViewController.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/13/22.
//

import UIKit

class ViewController: UIViewController {

    let ticksPerSecond = 12;
    let currTick = 0;
    let currSecond = 0;
    var tickStorage : [String: Int] = [:]
    var upgradeStorage : [String: [:]] = [:]
    let timer = Timer();

    override func viewDidLoad() {
        super.viewDidLoad();
        // Timer for updating based on defined tick rate
        self.timer = Timer.scheduledTimer(withTimeInterval: (1 / ticksPerSecond), repeats: true, block: { _ in
            Update();
            currTick++;
            currSecond = currTick / ticksPerSecond;
        });
    }

    func Update() { // Update method is ran every tick

        //Chopper

        if (tickStorage["Chopper"] >= Chopper.wantedTicks()) {

        }

        //Luberjack

        //Chainsaws

        //Wood Chipper

        //Wood Mill

        //Wood Factory

        //Wood Complex

    }

}

