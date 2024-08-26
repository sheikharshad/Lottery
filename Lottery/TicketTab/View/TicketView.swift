//
//  TicketView.swift
//  Lottery
//
//  Created by Arshad shaikh on 22/08/2024.
//
import SwiftUI
import Foundation

struct TicketView: View {
  @ObservedObject var viewModel: TicketViewModel
  
  private enum Keys: String, Localizable {
    case winner = "winner"
    case notWinner = "not_winner"
    case yourTickets = "your_tickets"
  }
  
  var body: some View {
    NavigationView {
      VStack {
        List(viewModel.tickets) { ticket in
          VStack(spacing: 6) {
            HStack {
              Image(systemName: "calendar")
                .foregroundColor(.black)
              CustomLabel(text: ticket.drawDate, font: .system(size: 18, weight: .semibold), color: .black)
              Spacer()
            }
            // Draw Numbers
            HStack(spacing: 8) {
              ForEach([ticket.number1, ticket.number2, ticket.number3, ticket.number4, ticket.number5, ticket.number6, ticket.bonusBall], id: \.self) { number in
                CircularNumberView(number: number, isBonus: number == ticket.bonusBall)
              }
            }
            if ticket.isWinner {
              CustomLabel(text: Keys.winner.value, font: .system(size: 18, weight: .bold), color: .green)
            } else {
              CustomLabel(text: Keys.notWinner.value, font: .system(size: 18, weight: .bold), color: .red)
            }
          }
        }
        .listStyle(PlainListStyle())
        
      }
      .navigationTitle(Keys.yourTickets.value)
    }
  }
}
