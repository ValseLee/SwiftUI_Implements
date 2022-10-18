//
//  FruitListView.swift
//  FruitMart
//
//  Created by 이승준 on 2022/10/18.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct FruitListView: View {
    let fruits = ["사과", "배", "포도", "바나나"]
    let drinks = ["물", "우유", "탄산수"]
    
    var body: some View {
        List {
            Text("Fruits").font(.largeTitle)
            ForEach(fruits, id: \.self) {
                Text($0)
            }
            EmptyView()
            Text("Drinks").font(.largeTitle)
            ForEach(drinks, id: \.self) {
                Text($0)
            }
        }
    }
}

struct FruitListView_Previews: PreviewProvider {
    static var previews: some View {
        FruitListView()
    }
}
