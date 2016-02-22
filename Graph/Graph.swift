//
//  Graph.swift
//  
//
//  Created by Stefan Peterson on 2/16/16.
//
//


public class Graph<T: Equatable> {
    var vertices: [T]
    var edges: [[Edge]] // our adjacency list
    
    public var vertexCount: Int { return vertices.count }
    
    init() {
        self.vertices = [T]()
        self.edges = [[Edge]]()
    }
    
    init(vertices: [T]) {
        self.vertices = [T]()
        edges = [[Edge]]()
        
        for vertex in vertices {
            self.addVertex(vertex)
        }
    }
    
    public func addVertex(v: T) {
        vertices.append(v)
        edges.append([Edge]())
    }
    
    public func addEdge(e: Edge) {
        if let org = e.origin {
            edges[org].append(e)
        }
    }
    
    public func connectTwovertices(source: T, dest: T, weight: Int?) {
        if let sourceIndex = getIndexForVertex(source) {
            if let destIndex = getIndexForVertex(dest) {
                addEdge(Edge(origin: sourceIndex, destination: destIndex, weight: weight ))
            }
        }
    }
    
    public func getIndexForVertex(v: T) -> Int? {
        if let index = vertices.indexOf(v) {
            return index
        }
        return nil
    }
    
    public func vertexAtIndex(index: Int) -> T {
        return vertices[index]
    }
    
    private func removeInRange(index: Int, left: Int, right: Int) {
        for i in left..<right {
            var indicesToRemove = [Int]()
            for j in 0..<edges[i].count {
                if edges[i][j].destination == index {
                    indicesToRemove.append(j)
                    continue
                }
                if edges[i][j].destination > index {
                    if edges[i][j].destination != nil {
                        edges[i][j].destination! -= 1
                    }
                }
            }
            for k in indicesToRemove {
                edges[i].removeAtIndex(k)
            }
        }
        
    }
    
    public func removeVertex(v: T) {
        if let index = getIndexForVertex(v) {
            removeVertexAtIndex(index)
        }
    }
    
    public func removeVertexAtIndex(index: Int) {
        removeInRange(index, left: 0, right: index)
        removeInRange(index, left: index + 1, right: edges.count)
        
        edges.removeAtIndex(index)
        vertices.removeAtIndex(index)
    }
}
