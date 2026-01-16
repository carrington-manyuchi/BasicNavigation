//
//  NavigationStructsDemo.swift
//  BasicNavigation
//
//  Created by Manyuchi, Carrington C on 2026/01/16.
//

import SwiftUI


struct Product: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let price: Double
}

struct NavigationStructsDemo: View {
    let products: [Product] = [
        .init(name: "iPhone", price: 999),
        .init(name: "iOS", price: 549),
        .init(name: "macBook", price: 129),
        .init(name: "ipad", price: 369)
    ]
    
    var body: some View {
        NavigationStack {
            List(products) { product in
                NavigationLink(value: product) {
                    Text(product.name)
                        .bold()
                }
            }
            .navigationDestination(for: Product.self) { product in
                VStack {
                    Text(product.name)
                        .bold()
                    Text("Price: R\(product.price.formatted())")
                }
            }
        }
    }
}

#Preview {
    NavigationStructsDemo()
}
