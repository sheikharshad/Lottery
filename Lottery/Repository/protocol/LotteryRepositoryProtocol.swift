//
//  LotteryRepositoryProtocol.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//

import Foundation

protocol LotteryRepositoryProtocol {
  func fetchLotteryDraws() async -> [LotteryDraw]
}
