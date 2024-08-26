//
//  TicketModel.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//

import Foundation

struct TicketModel: Identifiable, Decodable {
  var id: String
  var drawDate: String
  var number1: String
  var number2: String
  var number3: String
  var number4: String
  var number5: String
  var number6: String
  var bonusBall: String
  var topPrize: Int
  var isWinner: Bool = false // New attribute to indicate if the draw (or ticket) is a winner
  
  init(id: String, drawDate: String, number1: String, number2: String, 
       number3: String, number4: String, number5: String, number6: String,
       bonusBall: String, topPrize: Int, isWinner: Bool = false) {
    self.id = id
    self.drawDate = drawDate
    self.number1 = number1
    self.number2 = number2
    self.number3 = number3
    self.number4 = number4
    self.number5 = number5
    self.number6 = number6
    self.bonusBall = bonusBall
    self.topPrize = topPrize
    self.isWinner = isWinner
  }
}
