//
//  FirebaseNetworkManager.swift
//  FirebaseBoilerplate
//
//  Created by 이승준 on 2022/12/26.
//

import SwiftUI
import FirebaseFirestore

final class FirebaseNetworkManager: ObservableObject {
	@Published var viewData = ""
	
	let firebaseMapPath = Firestore.firestore().collection("item")
	
	// MARK: FetchData
	/// Firestore에 Map 으로 저장된 데이터를 가져옵니다.
	/// Firestore의 Map 타입 데이터는 딕셔너리 키-밸류 타입으로 캐스팅 한 후, 다시 키를 참조하여 값을 가져올 수 있습니다.
	@MainActor
	public func fetchMapData() async -> Void {
		do {
			let fetchedSnapshot = try await firebaseMapPath.getDocuments()
			for fetchedDocuments in fetchedSnapshot.documents {
				let fetchedData = fetchedDocuments.data()
				let fetchedMap = fetchedData["options"] as? ItemDetailInfo ?? ItemDetailInfo(amount: 0, color: [""], purchaseData: Date.now)
				
				// Map Type Cast
				let castedMap = fetchedData["options"] as? [String: Any] ?? ["": "DEFAULT"]
				
				// get dictionary values by calling it
				let amount = castedMap["amount"] as? Int ?? 0
				let colorArray = castedMap["color"] as? [String]
				let purchaseData = castedMap["purchaseDate"] as? Timestamp ?? Timestamp(date: Date.now)
				
				// Date Formating
				let formattedDate = purchaseData.formattedKoreanTime()
			}
		} catch {
			dump("ERROR: FETCH FAILED \(error.localizedDescription)")
		}
	}
	
	// MARK: CreateData
	public func createMapData(with createData: ItemInfo) async -> Void {
		print(#function)
		do {
			try await firebaseMapPath.document("\(createData.id)").setData([
				"id": createData.id,
				"options": [
					"amount": createData.option.amount,
					"color": createData.option.color,
					"purchaseDate": Timestamp(date: createData.option.purchaseData)
				]
			])
		} catch {
			dump("ERROR: CREATE FAILED \(error.localizedDescription)")
		}
		
	}
}
