//
//  LocalJSONDataSourceTests.swift
//  LotteryTests
//
//  Created by Arshad shaikh on 25/08/2024.
//

import XCTest
@testable import Lottery

final class LocalJSONDataSourceTests: XCTestCase {
  
  var dataSource: LocalJSONDataSource!
  
  override func setUpWithError() throws {
    dataSource = LocalJSONDataSource()
  }
  
  override func tearDownWithError() throws {
  }
  
  func testLoadLotteryDrawsForExistingFile() {
    let draws = dataSource.loadLotteryDraws(.mockLotteryList)
    XCTAssertNotNil(draws)
    XCTAssertEqual(draws?.count, 3)
  }
  
  func testLoadLotteryDrawsForInvalidFile() {
    let draws = dataSource.loadLotteryDraws(.invalidFile)
    XCTAssertNil(draws, "The method should return nil for an invalid or non-existent file.")
  }
  
  func testLoadLotteryDrawsForInvalidJSON() {
    let draws = dataSource.loadLotteryDraws(.invalidJSON)
    XCTAssertNil(draws, "The method should return nil when encountering malformed JSON.")
  }
}
