//
//  CustomButton.swift
//  Lottery
//
//  Created by Arshad shaikh on 25/08/2024.
//

import Foundation
import SwiftUI

struct CustomButton: View {
  var title: String
  var foregroundColor: Color = .white
  var font: Font = .system(size: 14, weight: .bold)
  var action: () -> Void
  
  var body: some View {
    Button(action: action) {
      Text(title)
        .font(font)
        .padding()
        .frame(maxWidth: .infinity)
        .foregroundColor(foregroundColor)
        .cornerRadius(10)
      
    }
  }
}

//
//#Preview {
//    CustomButton()
//}
