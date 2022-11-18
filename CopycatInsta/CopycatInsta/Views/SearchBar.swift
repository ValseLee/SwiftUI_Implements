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
			TextField("Search", text: $searchText)
				.autocorrectionDisabled()
				.textInputAutocapitalization(.never)
				.padding(8)
				.padding(.horizontal, 20)
				.background((Color(.systemGray6)))
				.cornerRadius(8)
				.overlay {
					HStack {
						Image(systemName: "magnifyingglass")
							.foregroundStyle(.gray)
							.frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
					}
				}
		}
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
		SearchBar(searchText: .constant(""))
    }
}
