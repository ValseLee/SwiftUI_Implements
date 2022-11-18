//
//  SearchView.swift
//  CopycatInsta
//
//  Created by 이승준 on 2022/11/06.
//

import SwiftUI

struct SearchBar: View {
	@Binding var searchText: String
	
    var body: some View {
		HStack {
			Image(systemName: "magnifyingglass")
				.foregroundStyle(.gray)
			
			TextField(text: $searchText) {
				Text("Search")
			}
				.autocorrectionDisabled()
				.textInputAutocapitalization(.never)
		}
		.padding(10)
		.background(Color(.systemGray6))
		.cornerRadius(15)

    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
		SearchBar(searchText: .constant(""))
    }
}
