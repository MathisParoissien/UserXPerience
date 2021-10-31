//
//  ProfileView.swift
//  userXperience
//
//  Created by Mathis Paroisisen on 31/10/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct ProfileView: View {
    
    @State private var edit = false
    @State private var name = "Marc Libra"
    @State private var email = "marc-libra@gmail.com"
    
    var body: some View {
        VStack {
            Text("Profile")
                .font(.poppins(size: 30), weight: .semibold)
                .foregroundColor(.black)
                .overlay {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.Secondary)
                        .frame(width: 50, height: 5)
                        .padding(.top, 40)
                }
            ZStack(alignment: .bottomTrailing) {
                WebImage(url: URL(string: "https://picsum.photos/300")!)
                    .resizable()
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                if !edit {
                    Button {
                        HapticVibration.selection()
                        edit.toggle()
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 40, height: 40)
                                .foregroundColor(.Secondary)
                            Image(systemName: "pencil")
                                .foregroundColor(.white)
                                .font(.system(size: 20), weight: .bold)
                        }
                    }
                }
            }.padding()
            Text(name)
                .foregroundColor(.black)
                .font(.poppins(size: 20), weight: .semibold)
            if !edit {
                Text("Adult")
                    .font(.poppins(size: 15))
                    .foregroundColor(.black)
                    .padding()
                Text(email)
                    .font(.poppins(size: 15), weight: .semibold)
                    .foregroundColor(.Third)
                    .padding()
            } else {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Full Name")
                        .font(.poppins(size: 15))
                        .foregroundColor(.Third)
                    TextField("Full name", text: $name)
                        .frame(height: 50)
                        .padding(.leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.Secondary.opacity(0.5), lineWidth: 1)
                        )
                }.padding()
                VStack(alignment: .leading, spacing: 10) {
                    Text("Email")
                        .font(.poppins(size: 15))
                        .foregroundColor(.Third)
                    TextField("Email", text: $email)
                        .frame(height: 50)
                        .padding(.leading)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.Secondary.opacity(0.5), lineWidth: 1)
                        )
                }.padding()
                Button {
                    HapticVibration.selection()
                    edit.toggle()
                } label: {
                    Text("Save")
                        .font(.poppins(size: 15), weight: .semibold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                        .frame(height: 40)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.Secondary.opacity(0.4)))
                }.padding()
            }
            Spacer()
        }.padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
