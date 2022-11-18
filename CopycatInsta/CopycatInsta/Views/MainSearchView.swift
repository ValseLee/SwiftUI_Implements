//
//  MainSearchView.swift
//  CopycatInsta
//
//  Created by 이승준 on 2022/11/17.
//

import SwiftUI

struct MainSearchView: View {
	@State private var searchText: String = ""
	@State private var gridSystem: [GridItem] = [
		GridItem(.flexible(), spacing: 0),
		GridItem(.flexible(), spacing: 0),
		GridItem(.flexible(), spacing: 0)
	]
	
    var body: some View {
		ScrollView {
			// 상단 검색뷰
			SearchBar(searchText: $searchText)
				.padding()
			
			LazyVGrid(columns: gridSystem) {
				ForEach(0..<15, id: \.self) { index in
					Image(systemName: "star")
				}
			}
		}
    }
}

struct MainSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MainSearchView()
    }
}
