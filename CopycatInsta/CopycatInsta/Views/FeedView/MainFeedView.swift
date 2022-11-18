//
//  MainFeedView.swift
//  CopycatInsta
//
//  Created by 이승준 on 2022/11/06.
//

import SwiftUI

struct MainFeedView: View {
    var body: some View {
		ScrollView {
			LazyVStack(spacing: 32) {
				ForEach(0..<15, id: \.self) { _ in
					MainFeedCell()
				}
			}
			.padding(.top, 10)
		}
    }
}

struct MainFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MainFeedView()
    }
}
