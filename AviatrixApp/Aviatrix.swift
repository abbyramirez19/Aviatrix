//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//

import Foundation

class Aviatrix {
    var running = false
    var author : String
    var data = AviatrixData()
    var location : String
    var distanceTraveled = 0
    var maxFuel = 5000.0
    var fuelLevel = 5000.0
    var milesPerGallon = 0.4
    var fuelCost = 0.0
    var price = 0.0
    var difference = 0.0
    
    
    
    init(appAuthor:String, current:String){
        author = appAuthor
        location = current
    }
    
    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() -> Double {
        difference = maxFuel - fuelLevel
        fuelLevel = maxFuel
        price = data.fuelPrices[location]!
       fuelCost += price * difference
        return price * difference
        
        
    }
    
    func flyTo(destination : String) {
        distanceTraveled += distanceTo(target : destination, current : location)
        fuelLevel -= Double(distanceTraveled)/milesPerGallon
        location =  destination
        
        
        
    }
    
    func distanceTo(target : String, current : String) -> Int{
        return data.knownDistances[current]![target]!
    
    }
    
    func knownDestinations() -> [String] {
       return ["St. Louis", "Phoenix", "Denver", "SLC"]
    }
    
    func gallonsRefueled()->Double{
        return (5000-fuelLevel)
    }
}
