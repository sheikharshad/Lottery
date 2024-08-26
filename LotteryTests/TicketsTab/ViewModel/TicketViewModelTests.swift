//
//  TicketViewModelTests.swift
//  LotteryTests
//
//  Created by Arshad shaikh on 25/08/2024.
//

import XCTest
@testable import Lottery

final class TicketViewModelTests: XCTestCase {
  var repository: MockLotteryRepository!
  var viewModel: TicketViewModel!
  
  override func setUpWithError() throws {
    repository = MockLotteryRepository()
    viewModel = TicketViewModel(repository: repository)
    
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    repository = nil
    viewModel = nil
    
  }
  
  func testGenerateTickets() async {
    let expectedDraws = [
      LotteryDraw(id: "1", drawDate: "2023-08-01", number1: "1", number2: "2", number3: "3", number4: "4", number5: "5", number6: "6", bonusBall: "7", topPrize: 1000000),
      LotteryDraw(id: "2", drawDate: "2023-08-02", number1: "8", number2: "9", number3: "10", number4: "11", number5: "12", number6: "13", bonusBall: "14", topPrize: 1000000)
    ]
    repository.mockDraws = expectedDraws
    await viewModel.generateTickets()
    XCTAssertEqual(viewModel.tickets.count, expectedDraws.count)
  }
  
  func testGenerateTicketsFroIDAndDrawDate() async {
    let expectedDraw = LotteryDraw(id: "1", drawDate: "2023-08-01", number1: "1", number2: "2", number3: "3", number4: "4", number5: "5", number6: "6", bonusBall: "7", topPrize: 1000000)
    repository.mockDraws = [expectedDraw]
    await viewModel.generateTickets()
    let ticket = viewModel.tickets.first
    XCTAssertEqual(ticket?.id, expectedDraw.id)
    XCTAssertEqual(ticket?.drawDate, expectedDraw.drawDate)
  }
  
  func testGenerateTickets_ShouldNotMarkTicketAsWinnerWhenNumbersDoNotMatch() async {
    let nonWinningDraw = LotteryDraw(id: "1", drawDate: "2023-08-01", number1: "1", number2: "2", number3: "3", number4: "4", number5: "5", number6: "6", bonusBall: "7", topPrize: 1000000)
    repository.mockDraws = [nonWinningDraw]
    viewModel = TicketViewModel(repository: repository)
    await viewModel.generateTickets()
    let ticket = viewModel.tickets.first
    XCTAssertNotNil(ticket)
    XCTAssertTrue(ticket?.isWinner == false)
  }
}

final class MockLotteryRepository: LotteryRepositoryProtocol {
  var mockDraws: [LotteryDraw] = []
  
  func fetchLotteryDraws() async -> [LotteryDraw] {
    return mockDraws
  }
}
