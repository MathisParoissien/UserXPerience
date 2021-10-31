//
//  HistoryView.swift
//  userXperience
//
//  Created by Mathis Paroisisen on 31/10/2021.
//

import SwiftUI

struct HistoryView: View {
    
    @Environment(\.navigator) private var navigator
    @Environment(\.presenter) private var presenter
    
    private func makeTop() -> some View {
        HStack {
            Text("History")
                .font(.poppins(size: 30), weight: .semibold)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.Secondary)
                        .frame(width: 70, height: 4)
                        .padding(.top, 50)
                }
            Spacer()
            Button {
                HapticVibration.selection()
                presenter?.dismissSelf()
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.Secondary)
                        .frame(width: 30, height: 30)
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .font(.poppins(size: 15), weight: .bold)
                }
            }
        }.padding(25)
    }
    
    private func makeCell(name: String, reason: String, deposit: Bool, money: Int) -> some View {
        HStack {
            ZStack {
                Circle()
                    .foregroundColor(deposit ? .green.opacity(0.4) : .red.opacity(0.4))
                    .frame(width: 30, height: 30)
                    .padding()
                if deposit {
                    Image(systemName: "plus")
                        .frame(width: 15, height: 15)
                        .foregroundColor(.white)
                } else {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 14, height: 2)
                        .foregroundColor(.white)
                }
            }
            VStack(alignment: .leading) {
                Text(name)
                    .font(.poppins(size: 15))
                    .foregroundColor(.black)
                Text("\(deposit ? "Deposit for :" : "Expense for :") \(reason)")
                    .font(.poppins(size: 15))
                    .foregroundColor(.Third)
            }
            Spacer()
            Text("\(deposit ? "+" : "-") \(money) $")
                .font(.poppins(size: 20))
                .foregroundColor(deposit ? Color.green.opacity(0.4) : Color.red.opacity(0.6))
                .padding(.trailing)
        }.frame(height: 80)
            .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.white).shadow(color: deposit ? .green.opacity(0.4) : Color.red.opacity(0.4), radius: 10, x: 0, y: 2))
    }
    
    var body: some View {
        VStack {
            makeTop()
            ScrollView(showsIndicators: false) {
                makeCell(name: "Marc Libra", reason: "Son Birthday", deposit: true, money: 500)
                    .padding()
                makeCell(name: "Maria Libra", reason: "Gift", deposit: false, money: 150)
                    .padding()
                makeCell(name: "Sophia Libra", reason: "Mother Birthday", deposit: true, money: 50)
                    .padding()
                makeCell(name: "Mat Clark", reason: "Chips", deposit: false, money: 3)
                    .padding()
                makeCell(name: "Sylvie Rit", reason: "House Location", deposit: false, money: 100)
                    .padding()
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
