//
//  BuildViewWithGenerics.swift
//  testtesttest
//
//  Created by 이승준 on 2022/11/19.
//

import SwiftUI

// 오팩 타입의 뷰가 파라미터를 갖고 있다면 재사용을 위해 어떻게 초기화할 것인가.
struct BuildOpaqueTypeViewWithInit<SubView: View>: View {
	// 1. 뷰 프로토콜을 따르는 서브뷰 제너릭 타입을 리턴하도록 한다.
	private var opaqueTextView: (Bool) -> SubView
	
	// 2. 제너릭 뷰 타입을 리턴하는 위의 뷰를 초기화하기 위해 생성자를 정의한다.
	init(@ViewBuilder views opaqueTextView: @escaping (Bool) -> SubView) {
		self.opaqueTextView = opaqueTextView
	}
	
	
    var body: some View {
		NavigationStack {
			VStack {
				opaqueTextView(true)
				opaqueTextView(false)
				NavigationLink {
					BuildViewWithGenericParams(params: "문자열") { str in
						Text("\(str)")
							.font(.caption2)
					}
				} label: {
					Text("To Next")
				}
			}
		}
    }
}

struct BuildViewWithGenerics_Previews: PreviewProvider {
    static var previews: some View {
		
		// 3. 뷰를 생성하는 시점에 파라미터로 전달한다.
		// 그러나 오팩 타입을 리턴하기 때문에 이 경우 뷰빌더를 활용해야 한다.
		// 생성자를 선언하는 시점에 파라미터 앞에 뷰빌더를 써서 전달되는 아규먼트를 뷰빌더로 감싸는 방법이 있고,
		// 이 뷰를 생성하는 뷰 계층의 뷰빌더를 그대로 전달하는 방법이 있다.
		BuildOpaqueTypeViewWithInit(views: { isTrue in
			if isTrue { Text(isTrue.description + "Okay?") }
			else { Text("It is False :(") }
		})
    }
}
