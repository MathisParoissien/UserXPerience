//
//  BudgetView.swift
//  userXperience
//
//  Created by Mathis Paroisisen on 31/10/2021.
//

import SwiftUI

struct BudgetView: View {
    
    @Environment(\.navigator) private var navigator
    @Environment(\.presenter) private var presenter
    
    @State private var food = 20
    @State private var foodInt = 200
    
    @State private var gifts = 45
    @State private var giftsInt = 450
    
    @State private var act = 35
    @State private var actInt = 350
    
    private func makeTop() -> some View {
        HStack {
            Text("Budget")
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
    
    private func makeCell(title: String, percent: Binding<Int>, int: Binding<Int>) -> some View {
        HStack(spacing: 10) {
            Text(title)
                .font(.poppins(size: 25))
                .foregroundColor(.black)
            Spacer()
            Button {
                HapticVibration.selection()
                if percent.wrappedValue > 0 {
                    percent.wrappedValue -= 1
                    int.wrappedValue -= 10
                }
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(.Secondary)
                        .frame(width: 30, height: 30)
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 15, height: 2)
                        .foregroundColor(.white)
                }
            }
            Text("\(percent.wrappedValue)%")
                .font(.poppins(size: 25))
                .foregroundColor(.black)
            Button {
                HapticVibration.selection()
                if percent.wrappedValue < 100 && (food + gifts + act) < 100 {
                    percent.wrappedValue += 1
                    int.wrappedValue += 10
                }
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(.Secondary)
                        .frame(width: 30, height: 30)
                   Image(systemName: "plus")
                        .foregroundColor(.white)
                }
            }
        }
    }
    
    private func makeBudget() -> some View {
        VStack {
            Text("Total Budget")
                .font(.poppins(size: 15), weight: .semibold)
                .foregroundColor(.Third)
            Text("$ 1000")
                .font(.poppins(size: 20), weight: .semibold)
                .foregroundColor(.black)
                .padding()
            makeCell(title: "Food", percent: $food, int: $foodInt)
            Text("$ \(foodInt)")
                .padding(.top)
                .font(.poppins(size: 20), weight: .semibold)
                .overlay(RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.Primary)
                            .frame(width: 50, height: 5)
                            .padding(.top, 55))
            makeCell(title: "Gifts", percent: $gifts, int: $giftsInt)
                .padding(.top)
            Text("$ \(giftsInt)")
                .padding(.top)
                .font(.poppins(size: 20), weight: .semibold)
                .overlay(RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.Primary)
                            .frame(width: 50, height: 5)
                            .padding(.top, 55))
            makeCell(title: "Activities", percent: $act, int: $actInt)
                .padding(.top)
            Text("$ \(actInt)")
                .padding(.top)
                .font(.poppins(size: 20), weight: .semibold)
                .overlay(RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.Primary)
                            .frame(width: 50, height: 5)
                            .padding(.top, 55))
        }.padding(25)
    }
    
    var body: some View {
        VStack {
            makeTop()
            makeBudget()
            Spacer()
        }
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}
