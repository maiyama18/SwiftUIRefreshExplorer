//
//  ItemView.swift
//  SwiftUIRefreshExplorer
//
//  Created by 山口真生 on 2021/11/27.
//

import SwiftUI

struct ItemView: View {
    let num: Int
    
    var body: some View {
        Text("Item #\(num)")
            .padding()
            .frame(height: 44)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
