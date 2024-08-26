//
//  SplashView.swift
//  Lottery
//
//  Created by Arshad shaikh on 26/08/2024.
//

import Foundation
import SwiftUI

struct SplashView: View {
  
  var body: some View {
    ZStack {
      VStack {
        Image("SplashImage")
          .resizable()
          .scaledToFill()
          .edgesIgnoringSafeArea(.all)
      }
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    SplashView()
  }
}
