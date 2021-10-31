//
//  ChatDetailView.swift
//  userXperience
//
//  Created by Mathis Paroisisen on 31/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ChatDetailView: View {
    
    @Environment(\.navigator) private var navigator
    @Environment(\.presenter) private var presenter
    
    var name: String
    var url: String
    var online: Bool
    
    @State private var text = ""
    
    private func makeTop() -> some View {
        VStack {
            HStack {
                
                Button {
                    HapticVibration.selection()
                    navigator?.pop()
                } label: {
                    ZStack {
                        Circle()
                            .fill(Color.Secondary)
                            .frame(width: 30, height: 30)
                        Image(systemName: "arrow.left")
                            .foregroundColor(.white)
                            .font(.poppins(size: 15), weight: .bold)
                    }
                }
                
                WebImage(url: URL(string: url)!)
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                    .padding(.leading, 10)
                
                VStack(alignment: .leading) {
                    Text(name)
                        .font(.poppins(size: 18))
                    Text("\(online ? "Online" : "Offline")")
                        .font(.poppins(size: 12))
                }.padding(.leading, 10)
                
                Spacer()
                
                Image(systemName: "gearshape")
                    .foregroundColor(.Secondary)
                    .font(.poppins(size: 25))
            }.padding([.horizontal, .top])
            Rectangle()
                .frame(width: .infinity, height: 1)
                .foregroundColor(.white)
                .shadow(color: .black.opacity(0.5), radius: 1, x: 0, y: 2)
                .padding(.top, 4)
        }
    }
    
    private func makeCells(text: String) -> some View {
        HStack {
            Text(text)
                .font(.poppins(size: 14))
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.15)))
            Spacer()
        }
    }
    
    private func makeCells2(text: String) -> some View {
        HStack {
            Spacer()
            Text(text)
                .font(.poppins(size: 14))
                .padding()
                .background(RoundedRectangle(cornerRadius: 10).fill(Color.Secondary.opacity(0.5)))
        }
    }
    
    var body: some View {
        VStack {
            makeTop()
            ScrollView(showsIndicators: false) {
                Spacer()
                    .frame(height: 20)
                VStack(spacing: 20) {
                    makeCells(text: "Hello, Marc")
                    makeCells(text: "What time will you be home tonight ?")
                    makeCells2(text: "I'll be back at 6pm tonight")
                    makeCells(text: "Hmm... Ok")
                    makeCells(text: "Dont forget the shopping list, I really need my chocolate")
                }.padding(.horizontal)
            }
            Spacer()
            HStack {
                TextField("Send a message", text: $text)
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .foregroundColor(.Secondary)
            }.padding()
                .background(Rectangle().fill(Color.gray.opacity(0.15)))
                .padding(.bottom, 12)
        }.navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    }
}

struct ChatDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ChatDetailView(name: "test Libra", url: "https://picsum.photos/300", online: true)
    }
}
