//
//  userXperienceApp.swift
//  userXperience
//
//  Created by Mathis Paroisisen on 30/10/2021.
//

import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        return true
    }

}

@main
struct userXperienceApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    init() {
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

import Foundation
import UIKit
import AudioToolbox

final class HapticVibration {

    static private let generator = UINotificationFeedbackGenerator()
    static private let selectionFeedback = UISelectionFeedbackGenerator()

    static func generateVibration(_ style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }

    static func soft() {
        let generator: UIImpactFeedbackGenerator!
        if #available(iOS 13.0, *) {
            generator = UIImpactFeedbackGenerator(style: .soft)
        } else {
            generator = UIImpactFeedbackGenerator(style: .light)
        }
        generator.impactOccurred()
    }

    static func rigid() {
        let generator: UIImpactFeedbackGenerator!
        if #available(iOS 13.0, *) {
            generator = UIImpactFeedbackGenerator(style: .rigid)
        } else {
            generator = UIImpactFeedbackGenerator(style: .medium)
        }
        generator.impactOccurred()
    }

    static func selection() {
        selectionFeedback.selectionChanged()
    }

    static func success() {
        generator.notificationOccurred(.success)
    }

    static func error() {
        generator.notificationOccurred(.error)
    }

    static func warning() {
        generator.notificationOccurred(.warning)
    }

}
