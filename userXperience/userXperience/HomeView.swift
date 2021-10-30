//
//  HomeView.swift
//  userXperience
//
//  Created by Mathis Paroisisen on 30/10/2021.
//

import SwiftUI
import SwiftUIX

struct HomeView: View {
    
    private var date = Date()
    
    @Environment(\.navigator) private var navigator
    
    private func makeCell(name: String, date: String, people: Int, color: Color, join: Bool) -> some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(name)
                        .font(.poppins(size: 20), weight: .semibold)
                        .foregroundColor(.white)
                    Text("\(people) people")
                        .font(.poppins(size: 12), weight: .semibold)
                        .foregroundColor(color == .Secondary ? .white : .Third)
                }
                Spacer()
                Text(date)
                    .font(.poppins(size: 11), weight: .semibold)
                    .foregroundColor(color == .Secondary ? .white : .Third)
            }.padding(.horizontal, 30)
                .padding(.top, 25)
            Spacer()
            HStack {
                if join {
                    Spacer()
                }
                Button {
                    HapticVibration.selection()
                    navigator?.push(TeamView())
                } label: {
                    Text("\(join ? "Join" : "View")")
                        .font(.poppins(size: 12), weight: .semibold)
                        .foregroundColor(.white)
                        .padding(10)
                        .padding(.horizontal, 2)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 1))
                        .contentShape(Rectangle())
                }
            }.padding(.horizontal, 30)
            Spacer()
//            Text("test")
        }.frame(height: 140)
        .background(RoundedRectangle(cornerRadius: 30).fill(color))
        .padding(.horizontal, 30)
    }
    
    private func makeTop() -> some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("Share")
                    .font(.poppins(size: 30), weight: .regular)
                Text("Money")
                    .font(.poppins(size: 30), weight: .bold)
            }
            Spacer()
            VStack {
                Text("\(date.getFormattedDate(format: "dd"))")
                    .font(.poppins(size: 15), weight: .semibold)
                Text("\(date.getFormattedDate(format: "MMM"))")
                    .foregroundColor(.black.opacity(0.3))
                    .font(.poppins(size: 10))
                    .textCase(.uppercase)
            }.padding()
                .background(RoundedRectangle(cornerRadius: 16).stroke(Color.black.opacity(0.66), lineWidth: 1))
        }.padding(25)
    }
    
    var body: some View {
        VStack {
            makeTop()
            ScrollView(showsIndicators: false) {
                makeCell(name: "Roommates", date: "27 SEPT", people: 8, color: .Primary, join: false)
                makeCell(name: "Family", date: "1 OCT", people: 10, color: .Secondary, join: false)
                    .padding(.vertical, 6)
                makeCell(name: "Friends", date: "10 OCT", people: 2, color: .Primary, join: true)
            }
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


extension String {
    func getDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "dd"
        let date = dateFormatter.date(from:self)!
        return date
    }
}

extension Date {

    func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
    
}
