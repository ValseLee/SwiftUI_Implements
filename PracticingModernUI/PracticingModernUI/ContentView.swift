//
//  ContentView.swift
//  PracticingModernUI
//
//  Created by 이승준 on 2022/12/03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader {
			let safeArea = $0.safeAreaInsets
			let size = $0.size

			MainHome(safeArea: safeArea, size: size)
				.ignoresSafeArea(.container, edges: .top)
				
        }
		.preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
