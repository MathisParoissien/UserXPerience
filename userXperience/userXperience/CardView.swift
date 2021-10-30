//
//  CardView.swift
//  userXperience
//
//  Created by Mathis Paroisisen on 30/10/2021.
//

import SwiftUI

struct CardView: View {
    
    @Environment(\.navigator) private var navigator
    @Environment(\.presenter) private var presenter
    
    private func makeTop() -> some View {
        HStack {
            Text("Credit Card")
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
            Spacer()
            Image("Image-5")
                .resizable()
                .scaledToFit()
                .padding(.horizontal, 30)
            Image("Image-6")
                .resizable()
                .scaledToFit()
                .padding(30)
            Spacer()
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}

struct ScaleButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        MyButton(configuration: configuration)
    }

    struct MyButton: View {
        let configuration: ButtonStyle.Configuration
        var body: some View {
            configuration.label
                .scaleEffect(configuration.isPressed ? 0.9 : 1)
        }
    }
}
