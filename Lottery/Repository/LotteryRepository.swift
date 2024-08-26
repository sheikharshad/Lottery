//
//  LotteryRepository.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//
import Foundation
import SwiftUI
import SwiftData

final class LotteryRepository: LotteryRepositoryProtocol {
  private let localDataSource: LotteryDataSource
  private let cacheDataSource: CacheDataSource
  
  init(localDataSource: LotteryDataSource = LocalJSONDataSource(),
       cacheDataSource: CacheDataSource = CacheDataSource()) {
    self.localDataSource = localDataSource
    self.cacheDataSource = cacheDataSource
  }
  
  func fetchLotteryDraws() async -> [LotteryDraw] {
    // First, try to load data from the cache
    if let cachedData = cacheDataSource.loadLotteryDraws(.mockLotteryList), !cachedData.isEmpty {
      return cachedData
    }
    
    // Fallback to local JSON data if cache is empty or expired
    if let localData = localDataSource.loadLotteryDraws(.mockLotteryList) {
      // Save the fetched local data into the cache
      cacheDataSource.saveData(localData, cacheKey: LotteryCachedItems.mockLotteryList.rawValue)
      return localData
    }
    // If both cache and local data are unavailable, return an empty array
    return []
  }
}
