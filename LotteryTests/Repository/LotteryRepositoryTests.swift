//
//  LotteryRepositoryTests.swift
//  LotteryTests
//
//  Created by Arshad shaikh on 25/08/2024.
//

import XCTest
@testable import Lottery

final class LotteryRepositoryTests: XCTestCase {
  
  override func setUpWithError() throws {
    
  }
  
  override func tearDownWithError() throws {
  }
  
  func testFetchLotteryDrawsForCacheValid() async {
    let mockCacheDataSource = MockCacheDataSource(hasValidCache: true)
    let mockLocalDataSource = MockLocalJSONDataSource()
    let repository = LotteryRepository(localDataSource: mockLocalDataSource, cacheDataSource: mockCacheDataSource)
    let draws = await repository.fetchLotteryDraws()
    XCTAssertEqual(draws.count, 1)
    XCTAssertEqual(mockCacheDataSource.loadCallsCount, 1)
    XCTAssertEqual(mockLocalDataSource.loadCallsCount, 0)
  }
  
  func testFetchLotteryDrawsIsEmpty() async {
    let mockCacheDataSource = MockCacheDataSource(hasValidCache: false)
    let mockLocalDataSource = MockLocalJSONDataSource()
    let repository = LotteryRepository(localDataSource: mockLocalDataSource, cacheDataSource: mockCacheDataSource)
    let draws = await repository.fetchLotteryDraws()
    XCTAssertEqual(draws.count, 2)
    XCTAssertEqual(mockCacheDataSource.loadCallsCount, 1)
    XCTAssertEqual(mockLocalDataSource.loadCallsCount, 1)
  }
  
  func testFetchLotteryDrawsEmpty() async {
    let mockCacheDataSource = MockCacheDataSource(hasValidCache: false, shouldReturnEmpty: true)
    let mockLocalDataSource = MockLocalJSONDataSource(shouldReturnEmpty: true)
    let repository = LotteryRepository(localDataSource: mockLocalDataSource, cacheDataSource: mockCacheDataSource)
    let draws = await repository.fetchLotteryDraws()
    XCTAssertTrue(draws.isEmpty)
  }
}

// MARK: - Mock Classes

class MockCacheDataSource: CacheDataSource {
  var hasValidCache: Bool
  var shouldReturnEmpty: Bool
  var loadCallsCount = 0
  
  init(hasValidCache: Bool = true, shouldReturnEmpty: Bool = false) {
    self.hasValidCache = hasValidCache
    self.shouldReturnEmpty = shouldReturnEmpty
    super.init(userDefaults: UserDefaults(suiteName: "MockDefaults")!) // Call the superclass initializer
  }
  
  override func loadLotteryDraws(_ itemName: LotteryCachedItems) -> [LotteryDraw]? {
    loadCallsCount += 1
    if shouldReturnEmpty || !hasValidCache {
      return nil
    } else {
      return [LotteryDraw(id: "1", drawDate: "2024-01-01", number1: "10", number2: "20", number3: "30", number4: "40", number5: "50", number6: "60", bonusBall: "5", topPrize: 1000000)]
    }
  }
  
  override func saveData(_ data: [LotteryDraw], cacheKey: String) {
    // Mock implementation
  }
}


class MockLocalJSONDataSource: LotteryDataSource {
  var shouldReturnEmpty: Bool
  var loadCallsCount = 0
  
  init(shouldReturnEmpty: Bool = false) {
    self.shouldReturnEmpty = shouldReturnEmpty
  }
  
  func loadLotteryDraws(_ itemName: LotteryCachedItems) -> [LotteryDraw]? {
    loadCallsCount += 1
    if shouldReturnEmpty {
      return []
    } else {
      return [
        LotteryDraw(id: "1", drawDate: "2024-01-01", number1: "10", number2: "20", number3: "30", number4: "40", number5: "50", number6: "60", bonusBall: "5", topPrize: 1000000),
        LotteryDraw(id: "2", drawDate: "2024-01-02", number1: "11", number2: "21", number3: "31", number4: "41", number5: "51", number6: "61", bonusBall: "6", topPrize: 2000000)
      ]
    }
  }
}
