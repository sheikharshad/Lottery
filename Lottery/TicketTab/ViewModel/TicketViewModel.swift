//
//  TicketViewModel.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//
import Foundation

final class TicketViewModel: ObservableObject {
  @Published var tickets: [TicketModel] = []
  private let repository: LotteryRepositoryProtocol
  
  init(repository: LotteryRepositoryProtocol) {
    self.repository = repository
    Task {
      await generateTickets()
    }
  }
  
  func generateTickets() async {
  
      let fetchedDraws = await repository.fetchLotteryDraws()
      
      tickets = fetchedDraws.map { draw in
        let ticketNumbers = generateRandomNumbers()
        let isWinner = checkIfTicketIsWinner(numbers: ticketNumbers, for: draw)
        
        return TicketModel(
          id: draw.id,
          drawDate: draw.drawDate,
          number1: "\(ticketNumbers[0])",
          number2: "\(ticketNumbers[1])",
          number3: "\(ticketNumbers[2])",
          number4: "\(ticketNumbers[3])",
          number5: "\(ticketNumbers[4])",
          number6: "\(ticketNumbers[5])",
          bonusBall: "\(Int.random(in: 1...59))",  // Random bonus ball
          topPrize: isWinner ? 1000000 : 0,  // Prize amount if it's a winning ticket
          isWinner: isWinner
        )
      }
      print(tickets.count)
    
  }
  
   func generateRandomNumbers() -> [Int] {
    var numbers: Set<Int> = []
    while numbers.count < 6 {
      numbers.insert(Int.random(in: 1...59))
    }
    return Array(numbers).sorted()
  }
  
  private func checkIfTicketIsWinner(numbers: [Int], for draw: LotteryDraw) -> Bool {
    let drawNumbers = [
      Int(draw.number1)!,
      Int(draw.number2)!,
      Int(draw.number3)!,
      Int(draw.number4)!,
      Int(draw.number5)!,
      Int(draw.number6)!
    ]
    return numbers == drawNumbers.sorted()
  }
}


//
//final class TicketViewModel: ObservableObject {
//  @Published var tickets: [TicketModel] = []
//  private let winningDraws: [LotteryDraw]
//
//  init(winningDraws: [LotteryDraw]) {
//    self.winningDraws = winningDraws
//    generateTickets()
//  }
//
//  func generateTickets() {
//    tickets = (0..<5).map { _ in
//      let ticketNumbers = generateRandomNumbers()
//      let isWinner = checkIfTicketIsWinner(numbers: ticketNumbers)
//
//      return TicketModel(
//        id: UUID().uuidString,
//        drawDate: "Random",  // Random or custom date since these are generated tickets
//        number1: "\(ticketNumbers[0])",
//        number2: "\(ticketNumbers[1])",
//        number3: "\(ticketNumbers[2])",
//        number4: "\(ticketNumbers[3])",
//        number5: "\(ticketNumbers[4])",
//        number6: "\(ticketNumbers[5])",
//        bonusBall: "\(Int.random(in: 1...59))",  // Random bonus ball
//        topPrize: isWinner ? 1000000 : 0,  // Prize amount if it's a winning ticket
//        isWinner: isWinner
//      )
//    }
//  }
//
//  private func generateRandomNumbers() -> [Int] {
//    var numbers: Set<Int> = []
//    while numbers.count < 6 {
//      numbers.insert(Int.random(in: 1...59))
//    }
//    return Array(numbers).sorted()
//  }
//
//  func checkIfTicketIsWinner(numbers: [Int]) -> Bool {
//    for draw in winningDraws {
//      let drawNumbers = [
//        Int(draw.number1)!,
//        Int(draw.number2)!,
//        Int(draw.number3)!,
//        Int(draw.number4)!,
//        Int(draw.number5)!,
//        Int(draw.number6)!
//      ]
//      if numbers == drawNumbers.sorted() {
//        return true
//      }
//    }
//    return false
//  }
//}
