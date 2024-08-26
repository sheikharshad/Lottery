//
//  LotteryListView.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//

import Foundation
import SwiftUI

struct LotteryListView: View {
  @ObservedObject var viewModel: LotteryViewModel
  @State private var selectedDraw: LotteryDraw?
  @State private var isNavigationActive = false// Control the navigation state
  
  private enum Keys: String, Localizable {
    case drawHistory = "draw_history"
  }

  var body: some View {
    NavigationView {
      List(viewModel.lotteryDraws) { draw in
        LotteryDrawRowView(draw: draw, onSelect: {
          selectedDraw = draw
          isNavigationActive = true  // Trigger navigation on select
        })
        .buttonStyle(PlainButtonStyle())
      }
      .listStyle(PlainListStyle())
      .navigationTitle(Keys.drawHistory.value)
      .background(
        NavigationLink(
          destination: Group {
            if selectedDraw != nil {
              LotteryDetailView(draws: viewModel.lotteryDraws, selectedDraw: $selectedDraw,
                                isNavigationActive: $isNavigationActive)
              .navigationBarBackButtonHidden(true)
            }
          },
          isActive: $isNavigationActive,  // Control navigation state
          label: {
            EmptyView()
          }
        )
      )
    }
  }
}
