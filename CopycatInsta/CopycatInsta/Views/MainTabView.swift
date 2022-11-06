//
//  ContentView.swift
//  CopycatInsta
//
//  Created by 이승준 on 2022/11/06.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
