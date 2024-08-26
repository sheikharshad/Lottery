//
//  CacheDataSourceTests.swift
//  LotteryTests
//
//  Created by Arshad shaikh on 25/08/2024.
//

import XCTest
@testable import Lottery

final class CacheDataSourceTests: XCTestCase {
  
  var userDefaults: UserDefaults!
  var cacheDataSource: CacheDataSource!
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    userDefaults = UserDefaults(suiteName: "TestDefaults")
    cacheDataSource = CacheDataSource(userDefaults: userDefaults)
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    userDefaults.removePersistentDomain(forName: "TestDefaults")
  }
  
  func testLoadLotteryDrawsIsValidCachedData() {
    let draw = LotteryDraw(id: "1", drawDate: "2024-01-01", number1: "10", number2: "20", number3: "30", number4: "40", number5: "50", number6: "60", bonusBall: "5", topPrize: 1000000)
    cacheDataSource.saveData([draw], cacheKey: LotteryCachedItems.mockLotteryList.rawValue)
    let cachedDraws = cacheDataSource.loadLotteryDraws(.mockLotteryList)
    XCTAssertNotNil(cachedDraws)
    XCTAssertEqual(cachedDraws?.count, 1)
  }
  
  func testLoadLotteryDrawsNoCache() {
    let cachedDraws = cacheDataSource.loadLotteryDraws(.mockLotteryList)
    XCTAssertNil(cachedDraws, "The method should return nil if there is no cached data.")
  }
  
  func testSaveData() {
    let draw = LotteryDraw(id: "1", drawDate: "2024-01-01", number1: "10", number2: "20", number3: "30", number4: "40", number5: "50", number6: "60", bonusBall: "5", topPrize: 1000000)
    cacheDataSource.saveData([draw], cacheKey: LotteryCachedItems.mockLotteryList.rawValue)
    let cachedDraws = cacheDataSource.loadLotteryDraws(.mockLotteryList)
    XCTAssertNotNil(cachedDraws)
    XCTAssertEqual(cachedDraws?.first?.id, draw.id)
  }
  
}
