//
//  CircularNumberView.swift
//  Lottery
//
//  Created by Arshad shaikh on 23/08/2024.
//

import Foundation
import SwiftUI

struct CircularNumberView: View {
  let number: String
  var isBonus: Bool = false
  
  var body: some View {
    Text(number)
      .font(.system(size: 20, weight: .bold))
      .frame(width: 36, height: 36)
      .background(isBonus ? Color.yellow : Color.blue)
      .foregroundColor(.white)
      .clipShape(Circle())
      .overlay(
        Circle().stroke(isBonus ? Color.yellow : Color.blue, lineWidth: 2)
      )
  }
}
