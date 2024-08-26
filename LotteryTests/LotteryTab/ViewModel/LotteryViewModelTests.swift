//
//  LotteryViewModelTests.swift
//  LotteryTests
//
//  Created by Arshad shaikh on 25/08/2024.
//

import XCTest
@testable import Lottery

final class LotteryViewModelTests: XCTestCase {
  
  override func setUpWithError() throws {
  }
  
  override func tearDownWithError() throws {
  }
  
  func testLotteryDrawsIsLoading() async {
    let expectedDraws = [
      LotteryDraw(id: "1", drawDate: "2024-01-01", number1: "10", number2: "20", number3: "30", number4: "40", number5: "50", number6: "60", bonusBall: "5", topPrize: 1000000),
      LotteryDraw(id: "2", drawDate: "2024-01-02", number1: "11", number2: "21", number3: "31", number4: "41", number5: "51", number6: "61", bonusBall: "6", topPrize: 2000000)
    ]
    let mockRepository = MockLotteryRepository(drawsToReturn: expectedDraws)
    let viewModel = LotteryViewModel(repository: mockRepository)
    await viewModel.loadLotteryDraws()
    XCTAssertEqual(viewModel.lotteryDraws, expectedDraws)
  }
  
  func testLoadLotteryDrawsForEmpty() async {
    let mockRepository = MockLotteryRepository(drawsToReturn: [])
    let viewModel = LotteryViewModel(repository: mockRepository)
    await viewModel.loadLotteryDraws()
    XCTAssertTrue(viewModel.lotteryDraws.isEmpty)
  }
  
  func testLoadLotteryDrawsforSingleDraw() async {
    let expectedDraw = LotteryDraw(id: "1", drawDate: "2024-01-01", number1: "10", number2: "20", number3: "30", number4: "40", number5: "50", number6: "60", bonusBall: "5", topPrize: 1000000)
    let mockRepository = MockLotteryRepository(drawsToReturn: [expectedDraw])
    let viewModel = LotteryViewModel(repository: mockRepository)
    await viewModel.loadLotteryDraws()
    XCTAssertEqual(viewModel.lotteryDraws.count, 1)
    XCTAssertEqual(viewModel.lotteryDraws.first, expectedDraw)
  }
  
  final class MockLotteryRepository: LotteryRepositoryProtocol {
    private let drawsToReturn: [LotteryDraw]
    
    init(drawsToReturn: [LotteryDraw]) {
      self.drawsToReturn = drawsToReturn
    }
    
    func fetchLotteryDraws() -> [LotteryDraw] {
      return drawsToReturn
    }
  }
}
