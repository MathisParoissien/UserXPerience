//
//  ContentView.swift
//  userXperience
//
//  Created by Mathis Paroisisen on 30/10/2021.
//

import SwiftUI
import SwiftUIX

struct ContentView: View {
    
    @State private var selection = 1
    
    init() {
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selection) {
                StackNavigationView {
                    HomeView()
                        .navigationBarHidden(true)
                }.tag(1)
                Text("test 2")
                    .tag(2)
                StackNavigationView {
                    ChatView()
                        .navigationBarHidden(true)
                }.tag(3)
                StackNavigationView {
                    ProfileView()
                        .navigationBarHidden(true)
                }.tag(4)
            }
            
            HStack() {
                TabBarItem(selection: $selection, number: 1, title: "Historique", icon: "house.fill")
                TabBarItem(selection: $selection, number: 2, title: "Scan", icon: "heart.fill")
                TabBarItem(selection: $selection, number: 3, title: "Recherche", icon: "message.fill")
                TabBarItem(selection: $selection, number: 4, title: "Favoris", icon: "person.fill")
                
            }
            .padding(.horizontal)
            .padding(.top)
            .frame(width: UIScreen.screenWidth, height: 60)
            .background(
                Rectangle()
                    .fill(Color.white)
                    .edgesIgnoringSafeArea(.all)
                    .shadow(color: .black.opacity(0.05), radius: 3, x: 0.0, y: 0.0)
            )
        }.navigationBarHidden(true)
            .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}

struct TabBarItem: View {
    
    @Binding var selection: Int
    
    var number: Int
    var title: String
    var icon: String
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .renderingMode(.template)
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(selection == number ? .Primary : .Primary.opacity(0.2))
            
        }.contentShape(Rectangle())
        .onTapGesture {
                selection = number
        }.frame(maxWidth: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

extension Color {
    static let Primary = Color("primary")
    static let Secondary = Color("secondary")
    static let Third = Color("gray")
}

extension Font {
    
    static func poppins(size: CGFloat = 15) -> Font {
       return Font.custom("Poppins-Regular", size: size)
    }
    
}
