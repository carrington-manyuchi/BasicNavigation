//
//  DynamicNavigation.swift
//  BasicNavigation
//
//  Created by Manyuchi, Carrington C on 2026/01/17.
//

import SwiftUI

struct User: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let age: Int
}

struct DynamicNavigation: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Button("Got to Int 42") {
                    path.append(42)
                }
                
                Button("Go to user Struct") {
                    path.append(User(name: "Bob", age: 23))
                }
                
                Button("Go througha chain") {
                    path.append(42)
                    path.append("Hello again")
                    path.append(User(name: "Alice", age: 24))
                }
                
                Button("Go to string hellow") {
                    path.append("Hello")
                }
            }
            .navigationTitle("Dynamic navigation")
            .navigationDestination(for: Int.self) { value in
                IntView(value: value)
            }
            .navigationDestination(for: String.self) { text in
                StringView(text: text)
            }
            .navigationDestination(for: User.self) { user in
                UserView(user: user)
            }
        }
    }
}

#Preview {
    DynamicNavigation()
}


struct IntView: View {
    let value: Int
    var body: some View {
        VStack(spacing: 20) {
            Text("Int View")
                .font(.headline)
            
            Text("Value: \(value)")
                .font(.title)
        }
    }
}


struct StringView: View {
    let text: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("String View")
                .font(.headline)
            
            Text(text)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

struct UserView: View {
    @Environment(\.dismiss) var dismiss
    let user: User
    var body: some View {
        VStack {
            Text("Name: \(user.name)")
            Text("Age: \(user.age)")
        }
    }
}
