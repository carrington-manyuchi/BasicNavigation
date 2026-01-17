//
//  NavigationDemoIsPresented.swift
//  BasicNavigation
//
//  Created by Manyuchi, Carrington C on 2026/01/16.
//

import SwiftUI

struct NavigationDemoIsPresented: View {
    
    @State private var isAnimation = false
    @State private var navigate = false
    let duration = 3
    
    var body: some View {
        NavigationStack {
            VStack {
                Circle()
                    .trim(from: 0, to: isAnimation ? 1 : 0)
                    .stroke(.blue, lineWidth: 3)
                    .frame(width: 150, height: 150)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2)) {
                            isAnimation = true
                        } completion: {
                            navigate = true
                        }
                    }
            }
            .navigationTitle("Loading...")
            .navigationDestination(isPresented: $navigate) {
                Text("View Presented")
                    .navigationBarBackButtonHidden()

            }
        }
    }
}

#Preview {
    NavigationDemoIsPresented()
}
