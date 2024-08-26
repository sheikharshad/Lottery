//
//  LotteryDataSource.swift
//  Lottery
//
//  Created by Arshad shaikh on 24/08/2024.
//

import Foundation

protocol LotteryDataSource {
  func loadLotteryDraws(_ itemName: LotteryCachedItems) -> [LotteryDraw]?
}
