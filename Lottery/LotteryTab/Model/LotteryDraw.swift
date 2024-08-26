//
//  LotteryDraw.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//

import Foundation
import SwiftData

struct LotteryData: Codable {
  let draws: [LotteryDraw]
}

// MARK: - LotteryDraw
struct LotteryDraw: Codable, Identifiable, Hashable {
  let id, drawDate, number1, number2: String
  let number3, number4, number5, number6: String
  let bonusBall: String
  let topPrize: Int
  
  enum CodingKeys: String, CodingKey {
    case id, drawDate, number1, number2, number3, number4, number5, number6
    case bonusBall = "bonus-ball"
    case topPrize
  }
}

