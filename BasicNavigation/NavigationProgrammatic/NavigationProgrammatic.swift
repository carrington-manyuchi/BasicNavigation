//
//  NavigationProgrammatic.swift
//  BasicNavigation
//
//  Created by Manyuchi, Carrington C on 2026/01/16.
//

import SwiftUI

struct NavigationProgrammatic: View {
    @State private var isAnimating = false
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Circle()
                    .trim(from: 0, to: isAnimating ? 1 : 0)
                    .stroke(.blue, lineWidth: 7)
                    .frame(width: 150, height: 150)
                    .animation(.easeInOut(duration: 1), value: isAnimating)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 3)) {
                            isAnimating = true
                        } completion: {
                            path.append("next")
                        }

                    }
            }
            .navigationTitle("Loading")
            .navigationDestination(for: String.self) { _ in
                NewView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    NavigationProgrammatic()
}


struct NewView: View {
    var body: some View {
        VStack {
            Text("Welcome to the next screen!")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .padding()
            
            Text("No going back")
                .foregroundStyle(.secondary)
            }
    }
}
