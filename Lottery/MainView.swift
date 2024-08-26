//
//  ContentView.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//
import SwiftUI

struct MainView: View {
  @ObservedObject var viewModel: SplashViewModel
  
  private enum Keys: String, Localizable {
    case results
    case tickets
  }
  
  var body: some View {
    if viewModel.isActive {
      SplashView()
    } else {
      TabView {
        LotteryListView(viewModel: LotteryViewModel(repository: LotteryRepository()))
          .tabItem {
            Label(Keys.results.value, systemImage: "list.dash")
          }
        TicketView(viewModel: TicketViewModel(repository: LotteryRepository()))
          .tabItem {
            Label(Keys.tickets.value, systemImage: "ticket")
          }
      }
    }
  }
}

#Preview {
  MainView(viewModel: SplashViewModel())
}
