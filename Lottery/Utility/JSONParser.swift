//
//  JSONParser.swift
//  Lottery
//
//  Created by Arshad shaikh on 24/08/2024.
//

import Foundation

struct JSONParser {
  func parse<T: Decodable>(_ type: T.Type, from data: Data) throws -> T {
    let decoder = JSONDecoder()
    return try decoder.decode(type, from: data)
  }
}
