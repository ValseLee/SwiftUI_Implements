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
        let titles = ["Fruits", "Drinks"]
        let dataArr = [fruits, drinks]
        
        List {
            ForEach(dataArr.indices) { index in
                Section {
                    ForEach(dataArr[index], id: \.self) {
                        Text($0)
                    }
                } header: {
                    Text(titles[index]).font(.largeTitle)
                } footer: {
                    HStack {
                        Spacer()
                        Text("\(dataArr[index].count)건")
                    }
                }
            }
        }.listStyle(.grouped)
    }
}

struct FruitListView_Previews: PreviewProvider {
    static var previews: some View {
        FruitListView()
    }
}
