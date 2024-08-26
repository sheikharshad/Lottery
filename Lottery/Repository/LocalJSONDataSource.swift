//
//  ListDataManager.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//

import Foundation

enum LotteryCachedItems: String {
  case mockLotteryList
  case invalidFile // Added for testing purposes
  case invalidJSON // Added for testing purposes
}

final class LocalJSONDataSource: LotteryDataSource {
  
  private let parser: JSONParser
  private let bundle: Bundle
  
  init(parser: JSONParser = JSONParser(), bundle: Bundle = .main) {
    self.parser = parser
    self.bundle = bundle
  }
  
  func loadLotteryDraws(_ itemName: LotteryCachedItems) -> [LotteryDraw]? {
    guard let url = bundle.url(forResource: itemName.rawValue, withExtension: "json") else {
      return nil
    }
    
    do {
      let data = try Data(contentsOf: url)
      let decodedData = try parser.parse(LotteryData.self, from: data)
      return decodedData.draws
    } catch {
      print("\(error)")
      return nil
    }
  }
}

