//
//  LotteryViewModel.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//

import Foundation

class LotteryViewModel: ObservableObject {
  @Published var lotteryDraws: [LotteryDraw] = []
  
  private let repository: LotteryRepositoryProtocol
  
  init(repository: LotteryRepositoryProtocol) {
    self.repository = repository
    Task {
      await self.loadLotteryDraws()
    }
  }
  
  func loadLotteryDraws() async {
      lotteryDraws =  await repository.fetchLotteryDraws()
  }
}
