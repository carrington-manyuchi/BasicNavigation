//
//  EnumNavigation.swift
//  BasicNavigation
//
//  Created by Manyuchi, Carrington C on 2026/01/17.
//

import SwiftUI

enum Screen: Hashable {
    case profile
    case settings
    case intSection(Int)
}

struct EnumNavigation: View {
    @State private var path: [Screen] = []
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Button("Go to Profile") {
                    path.append(.profile)
                }
                
                Button("Go to Settings") {
                    path.append(.settings)
                }
                
                Button("Go to Random Int View") {
                    let randomInt = Int.random(in: 1...100)
                    path.append(.intSection(randomInt))
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: Screen.self) { screen in
                switch screen {
                case .profile:
                    ProfileView(path: $path)
                case .settings:
                    SettingsView()
                    
                case .intSection(let value):
                    enumIntView(value: value, path: $path)
                    
                }
            }
        }
    }
}

#Preview {
    EnumNavigation()
}

struct SettingsView: View {
    var body: some View {
        Text("Settings screen")
            .font(.title)
            .navigationTitle("Settings")
    }
}

struct ProfileView: View {
    @Binding var path: [Screen]
    var body: some View {
        VStack {
            Text("Profile screen")
                .font(.title)
            
            Button("Go to randon Int view") {
                let randomInt = Int.random(in: 1...100)
                path.append(.intSection(randomInt))
            }
            
            Button("Back to home") {
               path = []
            }
            .foregroundStyle(.red)
        }
        .navigationTitle("Profile")
        .navigationBarBackButtonHidden()
    }
}

struct enumIntView: View {
    let value: Int
    @Binding var path: [Screen]
    
    var body: some View {
        VStack {
            Button("Go to randon Int View") {
                let randomInt = Int.random(in: 1...100)
                path.append(.intSection(randomInt))
            }
            
            Button("Back to home") {
               path = []
            }
            .foregroundStyle(.red)
        }
        .navigationTitle("IntView \(value)")
    }
}
