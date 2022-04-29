//
//  ItemInit.swift
//  TreeClicker
//
//  Created by William Dedominico on 4/20/22.
//

import Foundation
import UIKit

public class ItemInit {
    public static func initItems() {
        // Create Workers
        Workers.AddWorker(name: "Chopper", worker: Worker(wantedTicks: 6, moneyEarned: 1, cost: 100, lastTick: 0, count: 0));
        Workers.AddWorker(name: "Lumberjack", worker: Worker(wantedTicks: 24, moneyEarned: 20, cost: 1000, lastTick: 0, count: 0));
        Workers.AddWorker(name: "Chainsaw", worker: Worker(wantedTicks: 2, moneyEarned: 5, cost: 3000, lastTick: 0, count: 0));
        Workers.AddWorker(name: "WoodChipper", worker: Worker(wantedTicks: 50, moneyEarned: 96, cost: 10000, lastTick: 0, count: 0));
        Workers.AddWorker(name: "WoodMill", worker: Worker(wantedTicks: 100, moneyEarned: 974, cost: 1000000, lastTick: 0, count: 0));
        Workers.AddWorker(name: "WoodFactory", worker: Worker(wantedTicks: 1000, moneyEarned: 40000, cost: 50000000, lastTick: 0, count: 0));
        Workers.AddWorker(name: "WoodComplex", worker: Worker(wantedTicks: 20, moneyEarned: 10000, cost: 2147483647, lastTick: 0, count: 0));
        // Create Axes
        Axes.addAxe(level: 0, axe: Axe(Name: "Dirt Axe", Damage: 10, Image: UIImage(), Level: 0, Cost: 0));
        Axes.addAxe(level: 1, axe: Axe(Name: "Wood Axe", Damage: 50, Image: UIImage(), Level: 1, Cost: 1));
        Axes.addAxe(level: 2, axe: Axe(Name: "Stone Axe", Damage: 100, Image: UIImage(), Level: 2, Cost: 1));
        Axes.addAxe(level: 3, axe: Axe(Name: "Iron Axe", Damage: 100, Image: UIImage(), Level: 3, Cost: 1));
        Axes.addAxe(level: 4, axe: Axe(Name: "Gold Axe", Damage: 10000, Image: UIImage(), Level: 4, Cost: 1));
        Axes.addAxe(level: 5, axe: Axe(Name: "Diamond Axe", Damage: 50000, Image: UIImage(), Level: 5, Cost: 1));
        Axes.addAxe(level: 6, axe: Axe(Name: "Whalen Axe", Damage: 99999999, Image: UIImage(), Level: 6, Cost: 1));
        Axes.addAxe(level: 7, axe: Axe(Name: "Oliver Axe", Damage: 2147483647, Image: UIImage(), Level: 7, Cost: 1));
        // Create Trees
        Trees.AddTree(level: 0, tree: Tree(Name: "Dirt Tree", Health: 100, Worth: 10, Image: UIImage(named:"dirt tree")!, Level: 0, Cost: 10));
        Trees.AddTree(level: 1, tree: Tree(Name: "Wood Tree", Health: 5000, Worth: 100, Image: UIImage(named:"wood tree")!, Level: 1, Cost: 10));
        Trees.AddTree(level: 2, tree: Tree(Name: "Stone Tree", Health: 100000, Worth: 10000, Image: UIImage(named: "stone tree")!, Level: 2, Cost: 10));
        Trees.AddTree(level: 3, tree: Tree(Name: "Iron Tree", Health: 2000000, Worth: 509070, Image: UIImage(named: "iron tree")!, Level: 3, Cost: 10));
        Trees.AddTree(level: 3, tree: Tree(Name: "Gold Tree", Health: 20000900, Worth: 5097970, Image: UIImage(named: "gold tree")!, Level: 4, Cost: 10));
        Trees.AddTree(level: 4, tree: Tree(Name: "Diamond Tree", Health: 19809900, Worth: 19868750, Image: UIImage(named: "stone tree")!, Level: 5, Cost: 10));
        Trees.AddTree(level: 5, tree: Tree(Name: "Whalen Tree", Health: 999999999, Worth: 999999999, Image: UIImage(named: "gold tree")!, Level: 6, Cost: 10));
        Trees.AddTree(level: 6, tree: Tree(Name: "Oliver Tree", Health: 2147483647, Worth: 2147483647, Image: UIImage(named: "iron tree")!, Level: 7, Cost: 10));
        // Update User
        User.currAxe = Axes.axes[0]!;
        User.currTree = Trees.trees[0]!;
    }
}
