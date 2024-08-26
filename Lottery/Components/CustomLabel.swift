//
//  CustomLabel.swift
//  Lottery
//
//  Created by Arshad shaikh on 25/08/2024.
//

import Foundation
import SwiftUI

struct CustomLabel: View {
  var text: String
  var font: Font = .headline
  var color: Color = .gray
  
  var body: some View {
    Text(text)
      .font(font)
      .foregroundColor(color)
  }
}

#Preview {
  CustomLabel(text: "Custom Label")
}
