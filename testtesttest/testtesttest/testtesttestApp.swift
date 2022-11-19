//
//  testtesttestApp.swift
//  testtesttest
//
//  Created by 이승준 on 2022/10/19.
//

import SwiftUI

@main
struct testtesttestApp: App {
    var body: some Scene {
        WindowGroup {
			let param1: (String) -> Text = {
				Text($0 + "Has Been Initialized from previous view")
			}
			
			ContentView(initYourText: param1)
        }
    }
}
