//
//  MyListView.swift
//  PracticingModernUI
//
//  Created by 이승준 on 2022/12/04.
//

import SwiftUI

struct MyListView: View {	
    var body: some View {
		GeometryReader {
			let safeArea = $0.safeAreaInsets
			let size = $0.size
			
			NavigationStack {
				MainListView(safeArea: safeArea, viewSize: size)
					.ignoresSafeArea(.container, edges: .top)
					.preferredColorScheme(.dark)
//					.toolbarBackground(Color.indigo, for: .navigationBar)
//					.toolbarBackground(.visible, for: .navigationBar)
//					.toolbar {
//						ToolbarItem(placement: .cancellationAction) {
//							Button {
//								print("?")
//							} label: {
//								Image(systemName: "chevron.left")
//									.foregroundColor(.white)
//							}
//						}
//					}
			}
		}
    }
}

struct MyListView_Previews: PreviewProvider {
    static var previews: some View {
        MyListView()
    }
}
