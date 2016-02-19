//
//  Graph.swift
//  
//
//  Created by Stefan Peterson on 2/16/16.
//
//

protocol Edge {
    var origin: Int { get set }
    var destination: Int { get set }
    var weight: Int? { get set }
}