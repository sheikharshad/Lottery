//
//  LotteryDrawRowView.swift
//  Lottery
//
//  Created by Arshad shaikh on 23/08/2024.
//

import Foundation
import SwiftUI

struct LotteryDrawRowView: View {
  let draw: LotteryDraw
  var onSelect: () -> Void
  
  private enum Keys: String, Localizable {
    case drawDetails = "draw_details"
  }
  
  var body: some View {
    HStack {
      VStack(alignment: .leading) {
        HStack {
          Image(systemName: "calendar")
            .foregroundColor(.black)
          Text(draw.drawDate)
            .font(.headline)
          Spacer()
          Button(action: {
            onSelect()
          }) {
            CustomLabel(text: Keys.drawDetails.value, font: .system(size: 18, weight: .bold), color: .black)
              .padding(8)
              .background(
                RoundedRectangle(cornerRadius: 10)
                  .stroke(Color.black, lineWidth: 1)
              )
          }
        }
        .padding(.bottom, 5)
        HStack(spacing: 8) {
          ForEach([draw.number1, draw.number2, draw.number3, draw.number4, draw.number5, draw.number6, draw.bonusBall], id: \.self) { number in
            CircularNumberView(number: number, isBonus: number == draw.bonusBall)
          }
        }
      }
      Spacer()
    }
  }
}
