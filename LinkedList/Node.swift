//
//  Node.swift
//  
//
//  Created by Stefan Peterson on 2/15/16.
//
//

class Node<T: Equatable> {
    var value: T?
    var next: Node? // pointer to next node
}