//
//  ContentView.swift
//  testtesttest
//
//  Created by 이승준 on 2022/10/19.
//

import SwiftUI

struct ContentView: View {
	@State private var str = ""
	
	// Concrete Type View
	private var myTextView: Text = {
		Text("??")
	}()
	
	// Concrete Type View with Params
	// 클로저 파라미터를 쓰기 위해 계산 속성 내에서 다시 한 번 클로저로 감싸서 선언
	private var yourTextView: (String) -> Text {
		{ str in
			Text("\(str)하십니까")
		}
	}
	
	// 저장 속성에 클로저로 전달해주어도 좋다. 계산 속성은 중괄호 스코프가 나뉘어서 코드가독성이 떨어진다.
	private var yourAnotherTextView: (String) -> Text = { str in
		return Text("\(str)")
	}
	
	// 확정적인 뷰를 리턴한다면 뷰빌더가 필요 없다.
	private func yourTextViewMaker(str: String) -> Text {
		Text(str)
	}
	
	/*----------------------------------*/
	// 이 구조체를 생성하는 시점에,
	// 파라미터를 뷰에 전달하고 싶다면 이스케이핑 클로저를 활용한다.
	private var initYourText: (String) -> Text
	
	init(initYourText: @escaping (String) -> Text) {
		self.initYourText = initYourText
	}
	/*----------------------------------*/
	
    var body: some View {
		VStack {
			myTextView
			yourTextView("안녕")
			yourAnotherTextView("Hi")
			yourTextViewMaker(str: "안녕하세요")
			initYourText("호출 파라미터에 ")
			searchView(bindingText: $str)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
	// 프리뷰에서 속성을 선언할 땐 스태틱으로 해야 데이터 영역에서 프리뷰가 생성되며
	// 덕분에 인스턴스가 없는 것처럼 보이는 IDE 화면에서 프리뷰 확인이 가능하다.
	static var param1: (String) -> Text = {
		Text($0 + "Init This가 붙다니 귀하네요")
	}
	
    static var previews: some View {
		ContentView(initYourText: self.param1)
    }
}

