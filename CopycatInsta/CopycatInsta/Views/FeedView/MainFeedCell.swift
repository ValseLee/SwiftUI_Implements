//
//  MainFeedCell.swift
//  CopycatInsta
//
//  Created by 이승준 on 2022/11/06.
//

import SwiftUI

struct MainFeedCell: View {
    var body: some View {
		VStack(alignment: .leading) {
			// User Info
			HStack {
				Image(systemName: "person.crop.circle")
					.resizable()
					.scaledToFill()
					.frame(width: 36, height: 36)
					.clipped()
					.cornerRadius(18)
				
				Text("User Name")
					.font(.system(size: 14, weight: .semibold))
			}
			
			// Post Image
			Image(systemName: "sunset")
				.resizable()
				.scaledToFit()
				.clipped()
			
			// Action Btns
			HStack(spacing: 8) {
				Button {
					print()
				} label: {
					Image(systemName: "heart")
						.resizable()
						.scaledToFit()
						.frame(width: 20, height: 20)
						.clipped()
				}
				
				Button {
					print()
				} label: {
					Image(systemName: "bubble.right")
						.resizable()
						.scaledToFit()
						.frame(width: 20, height: 20)
						.clipped()
				}
				
				Button {
					print()
				} label: {
					Image(systemName: "paperplane")
						.resizable()
						.scaledToFit()
						.frame(width: 20, height: 20)
						.clipped()
				}
			}.foregroundColor(.black)
			
			// Caption
			HStack {
				Text("0 Likes")
			}
			
			HStack {
				Text("UserName")
					.font(.title3)
				
				Text("Feed Cell Description")
					.font(.body)
			}
			
			Text("uploaded Date")
				.font(.caption)
				.foregroundColor(.gray)
		}
		.padding()
    }
}

struct MainFeedCell_Previews: PreviewProvider {
    static var previews: some View {
        MainFeedCell()
    }
}
