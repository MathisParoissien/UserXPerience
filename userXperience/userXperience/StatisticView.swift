//
//  StatisticView.swift
//  userXperience
//
//  Created by Mathis Paroisisen on 31/10/2021.
//

import SwiftUI

struct StatisticView: View {
    
    @Environment(\.navigator) private var navigator
    @Environment(\.presenter) private var presenter
    
    private func makeTop() -> some View {
        HStack {
            Text("Statistics")
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
    
    var body: some View {
        VStack {
            makeTop()
            Image("Image-7")
                .resizable()
                .padding(25)
                .scaledToFit()
            Spacer()
        }
    }
}

struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticView()
    }
}
