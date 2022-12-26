//
//  ItemInfo.swift
//  FirebaseBoilerplate
//
//  Created by 이승준 on 2022/12/26.
//

import SwiftUI

struct ItemInfo: Codable, Identifiable {
	var id = UUID().uuidString
	var option: ItemDetailInfo
}

struct ItemDetailInfo: Codable {
	var amount: Int
	var color: [String]
	var purchaseData: Date
}

enum ItemDetailInfoType {
	case color(key: String = "color", updateWith: [String])
	case purchaseDate(key: String = "purchaseDate", updateWith: Date)
	case amount(key: String = "amount", updateWith: Int)
}
