//
//  TestView.swift
//  PracticingModernUI
//
//  Created by 이승준 on 2022/12/03.
//

import SwiftUI

struct TestView: View {
    var body: some View {
		GeometryReader { _ in
			ScrollView(.vertical) {
				VStack {
					Image("HYBS")
						.resizable()
						.aspectRatio(contentMode: .fill)
				}
			}
			.ignoresSafeArea()
		}
		
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
