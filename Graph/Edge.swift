//
//  Edge.swift
//  
//
//  Created by Stefan Peterson on 2/16/16.
//
//

public class Edge {
    var origin: Int?
    var destination: Int?
    var weight: Int?
    
    init() {
    }
    
    init(origin: Int?, destination: Int?, weight: Int?) {
        self.origin = origin
        self.destination = destination
        self.weight = weight
    }
}