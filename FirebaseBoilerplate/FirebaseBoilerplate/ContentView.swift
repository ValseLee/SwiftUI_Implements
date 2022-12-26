//
//  ContentView.swift
//  FirebaseBoilerplate
//
//  Created by 이승준 on 2022/12/26.
//

import SwiftUI

struct ContentView: View {
	@EnvironmentObject var firebaseNetworkManager: FirebaseNetworkManager
	
    var body: some View {
        VStack {
			Text("\(firebaseNetworkManager.viewData)")
        }
		.task {
			await firebaseNetworkManager.fetchMapData()
			await firebaseNetworkManager.createMapData(with: ItemInfo(option: ItemDetailInfo(amount: 100, color: ["갈색", "파랑"], purchaseData: Date.now)))
		}
    }
}
