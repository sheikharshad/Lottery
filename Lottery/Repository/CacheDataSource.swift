//
//  CacheDataSource.swift
//  Lottery
//
//  Created by Arshad shaikh on 24/08/2024.
//

import Foundation

class CacheDataSource: LotteryDataSource {
  
  private let userDefaults: UserDefaults
  private let encoder: JSONEncoder
  private let decoder: JSONDecoder
  
  init(userDefaults: UserDefaults = .standard, encoder: JSONEncoder = JSONEncoder(),
       decoder: JSONDecoder = JSONDecoder()) {
    self.userDefaults = userDefaults
    self.encoder = encoder
    self.decoder = decoder
  }
  
  func loadLotteryDraws(_ itemName: LotteryCachedItems) -> [LotteryDraw]? {
    let expirationInterval: TimeInterval = 60
    guard let cacheData = userDefaults.data(forKey: itemName.rawValue),
          let cachedObject = try? decoder.decode(CachedObject<[LotteryDraw]>.self, from: cacheData),
          Date().timeIntervalSince(cachedObject.timestamp) < expirationInterval else {
      return nil
    }
    return cachedObject.value
  }
  
  
  func saveData(_ data: [LotteryDraw], cacheKey: String) {
    let cachedObject = CachedObject(value: data, timestamp: Date())
    if let encoded = try? encoder.encode(cachedObject) {
      userDefaults.set(encoded, forKey: cacheKey)
    }
  }
  
  private struct CachedObject<T: Codable>: Codable {
    let value: T
    let timestamp: Date
  }
}
