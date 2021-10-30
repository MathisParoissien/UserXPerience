//
//  TeamView.swift
//  userXperience
//
//  Created by Mathis Paroisisen on 30/10/2021.
//

import SwiftUI

struct TeamView: View {
    
    @Environment(\.navigator) private var navigator
    
    private func makeTop() -> some View {
        ZStack {
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
                Spacer()
            }
            Text("My Team")
                .font(.poppins(size: 30), weight: .semibold)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.Secondary)
                        .frame(width: 70, height: 4)
                        .padding(.top, 50)
                }
        }.padding(.horizontal, 25)
            .padding(.top, 25)
        
    }
    
    private func makeButton(text: String, image: String, color: Color) -> some View {
        HStack {
            Text(text)
                .foregroundColor(.white)
                .font(.poppins(size: 20), weight: .semibold)
                .padding(.leading, 30)
            Spacer()
            Image(image)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing, 30)
        }.frame(height: 80)
        .background(RoundedRectangle(cornerRadius: 30)
                        .fill(color))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            makeTop()
            Spacer()
            Button {
                HapticVibration.selection()
            } label: {
                makeButton(text: "Commun Wallet", image: "Image-1", color: Color.Primary)
            }.buttonStyle(ScaleButtonStyle())
            .padding(.horizontal, 30)
            Button {
                HapticVibration.selection()
            } label: {
                makeButton(text: "Budget", image: "Image-2", color: Color.Secondary)
            }.buttonStyle(ScaleButtonStyle())
                .padding(.horizontal, 30)
            Button {
                HapticVibration.selection()
            } label: {
                makeButton(text: "Statistic", image: "Image-3", color: Color.Primary)
            }.buttonStyle(ScaleButtonStyle())
                .padding(.horizontal, 30)
            Button {
                HapticVibration.selection()
            } label: {
                makeButton(text: "Transaction history", image: "Image-4", color: Color.Secondary)
            }.buttonStyle(ScaleButtonStyle())
                .padding(.horizontal, 30)
            Button {
                HapticVibration.selection()
                navigator?.present {
                    CardView()
                }
            } label: {
                makeButton(text: "Credit Card", image: "Image", color: Color.Primary)
            }.buttonStyle(ScaleButtonStyle())
                .padding(.horizontal, 30)
            Spacer()
        }.navigationBarHidden(true)
    }
}

struct TeamView_Previews: PreviewProvider {
    static var previews: some View {
        TeamView()
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
