//
//  Detailview.swift
//  BasicNavigation
//
//  Created by Manyuchi, Carrington C on 2026/01/16.
//

import SwiftUI

struct Detailview: View {
    let item: Int
    
    init(item: Int) {
        self.item = item
    }
    
    var body: some View {
        Text("Selected item: \(item)")
    }
}

