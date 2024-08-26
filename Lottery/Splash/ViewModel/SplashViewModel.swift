//
//  SplashViewModel.swift
//  Lottery
//
//  Created by Arshad shaikh on 26/08/2024.
//

import SwiftUI
import Combine

final class SplashViewModel: ObservableObject {
  @Published var isActive: Bool = true
  
  init() {
    startSplashTimer()
  }
  
  private func startSplashTimer() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
      withAnimation {
        self.isActive = false
      }
    }
  }
}
