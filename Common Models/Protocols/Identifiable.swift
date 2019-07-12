//
//  Identifiable.swift
//  PokeKit
//
//  Created by James Lee on 09/07/2019.
//

public protocol Identifiable: Decodable {
    /// The identifier for this resource.
    var id: Int { get }
}
