//
//  ContentView.swift
//  BasicNavigation
//
//  Created by Manyuchi, Carrington C on 2026/01/16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List(1..<10) { item in
                    NavigationLink("item \(item)", value: item)
                }
                .navigationDestination(for: Int.self) { item in
                    Detailview(item: item)
                }
            }
            .padding()
            .navigationTitle("Home Screen")
        }
    }
}

#Preview {
    ContentView()
}


