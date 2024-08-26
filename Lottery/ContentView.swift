//
//  ContentView.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//

import SwiftUI

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
          LotteryListView(viewModel: LotteryViewModel(repository: LotteryRepository()))
                         .tabItem {
                             Label("Results", systemImage: "list.dash")
                         }
          TicketView(viewModel: TicketViewModel(winningDraws: LotteryRepository().fetchLotteryDraws()))
                          .tabItem {
                              Label("Tickets", systemImage: "ticket")
                          }
        }
    }
}

//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}

#Preview {
    MainView()
}
