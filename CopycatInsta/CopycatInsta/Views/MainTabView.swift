//
//  ContentView.swift
//  CopycatInsta
//
//  Created by 이승준 on 2022/11/06.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
		TabView {
			MainFeedView()
				.tabItem {
					Image(systemName: "house")
				}
			
			SearchView()
				.tabItem {
					Image(systemName: "magnifyingglass.circle")
				}
			
			UploadPostView()
				.tabItem {
					Image(systemName: "plus.square")
				}
			
			
			NotificationView()
				.tabItem {
					Image(systemName: "bag")
				}
			
			ProfileView()
				.tabItem {
					Image(systemName: "person.crop.circle")
				}
		}
		.accentColor(.black)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
