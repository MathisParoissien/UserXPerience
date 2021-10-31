//
//  ChatView.swift
//  userXperience
//
//  Created by Mathis Paroisisen on 31/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ChatView: View {
    
    @Environment(\.navigator) private var navigator
    @Environment(\.presenter) private var presenter
    
    @State private var search = ""
    
    private func makeTop() -> some View {
        HStack(alignment: .center) {
            Text("Chat")
                .font(.poppins(size: 30), weight: .semibold)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.Secondary)
                        .frame(width: 70, height: 4)
                        .padding(.top, 50)
                }
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                    .font(.poppins(size: 15))
                
                TextField("Search", text: $search)
                    .frame(height: 40)
                    .font(.poppins(size: 15))
            }.background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.15)))
                .padding(.leading, 10)
        }.padding(25)
    }
    
    private func makeCell(url: String, name: String, desc: String, time: String, online: Bool) -> some View {
        Button {
            HapticVibration.selection()
            navigator?.push(ChatDetailView(name: name, url: url, online: online))
        } label: {
            HStack(spacing: 15) {
                WebImage(url: URL(string: url)!)
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 6) {
                    Text(name)
                        .font(.poppins(size: 18))
                        .foregroundColor(.black)
                    Text(desc)
                        .foregroundColor(.black)
                        .lineLimit(1)
                        .font(.poppins(size: 12))
                }
                Spacer()
                VStack {
                    Text(time)
                        .font(.poppins(size: 12))
                        .foregroundColor(.black)
                    Spacer()
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            makeTop()
            ScrollView(showsIndicators: false) {
//                Spacer()
//                    .frame(height: 10)
                makeCell(url: "https://picsum.photos/300", name: "Maria Libra", desc: "Dont forget the shopping list, I really need my chocolate", time: "2H", online: true)
                makeCell(url: "https://picsum.photos/301", name: "David Jhonson", desc: "I need 300$ to complete my goal", time: "6H", online: false)
                    .padding(.top, 10)
                makeCell(url: "https://picsum.photos/302", name: "Steve Land", desc: "Dont forget the participation for halloween", time: "Yes", online: true)
                    .padding(.top, 10)
                makeCell(url: "https://picsum.photos/303", name: "Paulo Libra", desc: "I'll get the food fo tomorrow", time: "16 Oct", online: true)
                    .padding(.top, 10)
                makeCell(url: "https://picsum.photos/304", name: "Stan Libra", desc: "Find a good place to sleep for our roadtrip", time: "13 Oct", online: false)
                    .padding(.top, 10)
                makeCell(url: "https://picsum.photos/305", name: "Lola Libra", desc: "I need money Dad !", time: "10 Oct", online: false)
                    .padding(.top, 10)
                makeCell(url: "https://picsum.photos/306", name: "Cabriol Libra", desc: "I like saltos", time: "24 Sept", online: true)
                    .padding(.top, 10)
                makeCell(url: "https://picsum.photos/307", name: "Metamorph Libra", desc: "Tells Sacha to punish pikachu he fucked my electricity", time: "20 Sept", online: false)
                    .padding(.top, 10)
                makeCell(url: "https://picsum.photos/308", name: "Pikachu Libra", desc: "Hihihih i'll prank metamorph", time: "14 Sept", online: true)
                    .padding(.top, 10)
                Spacer()
                    .frame(height: 50)
            }.padding(.horizontal, 25)
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
