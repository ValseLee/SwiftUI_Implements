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
			ForEach(0..<15) { _ in
				MainFeedView()
			}
		}
    }
}

struct MainFeedView_Previews: PreviewProvider {
    static var previews: some View {
        MainFeedView()
    }
}
