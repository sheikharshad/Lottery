//
//  LotteryDetailView.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//

import Foundation
import SwiftUI

struct LotteryDetailView: View {
  var draws: [LotteryDraw]
  @Binding var selectedDraw: LotteryDraw?
  @Binding var isNavigationActive: Bool
  
  private enum Keys: String, Localizable {
    case details = "Details"
    case topPrize = "top_prize"
  }
  
  var body: some View {
    GeometryReader { geometry in
      VStack {
        ScrollViewReader { proxy in
          ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
              ForEach(draws) { draw in
                VStack(spacing: 20) {
                  // Date and Title
                  VStack {
                    HStack {
                      Image(systemName: "calendar")
                        .foregroundColor(.white)
                      CustomLabel(text: draw.drawDate, font: .system(size: 18, weight: .semibold), color: .black)
                    }
                    .padding(.top)
                    HStack(spacing: 8) {
                      ForEach([draw.number1, draw.number2, draw.number3, draw.number4, draw.number5, draw.number6, draw.bonusBall], id: \.self) { number in
                        CircularNumberView(number: number, isBonus: number == draw.bonusBall)
                      }
                    }
                  }
                  CustomLabel(text: "\(Keys.topPrize.value)\(draw.topPrize)", font: .system(size: 18, weight: .bold), color: .white)
                  Spacer()
                }
                .frame(width: geometry.size.width - 80, height: 200) // Card height with padding on all sides
                .background(Color.red)
                .cornerRadius(15)
                .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
                .overlay(
                  RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                )
                .id(draw.id) // Set the ID to help with ScrollViewReader
                .onTapGesture {
                  selectedDraw = draw
                }
              }
            }
            .padding(.horizontal, (geometry.size.width - 40) / 2) // Centering the selected draw
            .onAppear {
              if let selectedDraw = selectedDraw {
                proxy.scrollTo(selectedDraw.id, anchor: .center)
              }
            }
          }
        }
      }
      .navigationBarTitle(Keys.details.value, displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: {
            isNavigationActive = false
          }) {
            Image(systemName: "chevron.left")
              .foregroundColor(.black)
          }
        }
      }
    }
  }
}
