//
//  WalletView.swift
//  userXperience
//
//  Created by Mathis Paroisisen on 31/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct WalletView: View {
    
    @Environment(\.navigator) private var navigator
    @Environment(\.presenter) private var presenter
    
    private func makeTop() -> some View {
        HStack {
            Text("Wallet")
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
    
    private func makeAvatar(text: String, owner: Bool, url: String) -> some View {
        HStack(spacing: 25) {
            WebImage(url: URL(string: url)!)
                .resizable()
                .frame(width: 65, height: 65)
                .clipShape(Circle())
            //                .padding()
            VStack(alignment: .leading) {
                Text(text)
                    .font(.poppins(size: 20), weight: .semibold)
                    .foregroundColor(.black)
                if owner {
                    Text("Owner")
                        .font(.poppins(size: 15))
                        .foregroundColor(.Third)
                }
            }
            Spacer()
        }.padding(.vertical, 10)
    }
    
    private func makeWallet() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Actual Wallet")
                .font(.poppins(size: 15))
                .foregroundColor(Color.Third)
            Text("$ 1000")
                .padding()
                .font(.poppins(size: 20), weight: .semibold)
            Text("Actual Participants :")
                .font(.poppins(size: 20))
                .padding(.bottom)
            makeAvatar(text: "Maria Libra", owner: false, url: "https://picsum.photos/200")
            makeAvatar(text: "Marc Libra (Me)", owner: true, url: "https://picsum.photos/300")
            makeAvatar(text: "Sophia Libra", owner: false, url: "https://picsum.photos/250")
        }.padding(25)
            .frame(maxWidth: .infinity)
    }
    
    var body: some View {
        VStack {
            makeTop()
            makeWallet()
            Spacer()
            Text("Add to Wallet")
                .font(.poppins(size: 15), weight: .semibold)
            Button {
                HapticVibration.selection()
            } label: {
                ZStack {
                    Circle()
                        .foregroundColor(.green.opacity(0.4))
                        .frame(width: 30, height: 30)
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(.white)
                        .frame(width: 15, height: 15)
                }
            }
            Spacer()
        }
    }
}

struct WalletView_Previews: PreviewProvider {
    static var previews: some View {
        WalletView()
    }
}
