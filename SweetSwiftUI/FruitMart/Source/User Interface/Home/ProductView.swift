//
//  ProductView.swift
//  FruitMart
//
//  Created by 이승준 on 2022/10/18.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct ExtractedView: View {
    var body: some View {
        HStack {
            Image("apple")
                .resizable()
                .scaledToFill()
                .frame(width: 140)
                .clipped()
            
            VStack(alignment: .leading) {
                Text("백설공주 사과")
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.bottom, 6)
                Text("달콤한 맛이 좋은 과일의 여왕 사과. \n독은 없고 꿀만 가득해요!")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                Spacer()
                
                HStack(spacing: 0) {
                    Text("2,100원")
                    Spacer()
                    Image(systemName: "heart")
                        .foregroundColor(Color("peach"))
                    Image(systemName: "cart")
                        .foregroundColor(Color("peach"))
                }
            }
            .padding([.leading, .bottom], 12)
            .padding([.top, .trailing])
        }.frame(height: 150)
            .background(Color.primary.colorInvert())
            .cornerRadius(6)
            .shadow(color: .primary.opacity(0.33), radius: 1, x: 2, y: 2)
            .padding(.vertical, 8)
    }
}
