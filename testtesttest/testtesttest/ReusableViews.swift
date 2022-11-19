//
//  ReusableViews.swift
//  testtesttest
//
//  Created by 이승준 on 2022/11/19.
//

import Foundation
import SwiftUI

extension View {
	
	// 일관성 있는 상단 검색바를 위해 뷰를 확장할 수 있다.
	public func searchView(bindingText: Binding<String>) -> some View {
		HStack {
			Image(systemName: "magnifyingglass")
			
			TextField(text: bindingText) {
				Text("?")
			}
		}
	}
}
