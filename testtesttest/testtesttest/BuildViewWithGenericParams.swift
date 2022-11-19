//
//  buildViewWithGenericParams.swift
//  testtesttest
//
//  Created by 이승준 on 2022/11/19.
//

import SwiftUI

// 제너릭 파라미터를 갖고 있는 뷰를 정의하기 위해 ComponentView가 View 프로토콜을 채택하도록 하고 파라미터의 타입을 갖도록 한다.
struct BuildViewWithGenericParams<ComponentView: View, Parameter>: View {
	
	private var component: ComponentView
	
	// 2. 생성자에서 파라미터와 뷰의 바디를 나누어서 정의한 뒤에, 컴포넌트뷰의 아규먼트로 파라미터를 전달한다.
	// 아래 생성자에서는 어차피 이 구조체의 컴포넌트로 파라미터가 전달되기 때문에 escaping 키워드는 생략되었다.
	// 스코프 밖에서도 파라미터를 살려야 하는 경우라면 escaping 을 살리도록 하자.
	init(params: Parameter,
		 @ViewBuilder component: (Parameter) -> ComponentView) {
		self.component = component(params)
	}
    var body: some View {
        component
    }
}
