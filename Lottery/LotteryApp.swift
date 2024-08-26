//
//  LotteryApp.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//

import SwiftUI

@main
struct LotteryApp: App {
  var body: some Scene {
    WindowGroup {
      MainView(viewModel: SplashViewModel())
    }
  }
}
