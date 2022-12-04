//
//  MainListView.swift
//  PracticingModernUI
//
//  Created by 이승준 on 2022/12/04.
//

import SwiftUI

struct MainListView: View {
	public var safeArea: EdgeInsets
	public var viewSize: CGSize
	
	var body: some View {
		ScrollView(.vertical) {
			VStack {
				GeometryReader { proxy in
					let size = proxy.size
					let minY = proxy.frame(in: .named("MYMUSICSCROLLVIEW")).minY
					
					Color.indigo
						.overlay(alignment: .bottom) {
							LinearGradient(gradient: Gradient(colors: [.indigo, .black]), startPoint: .center, endPoint: .bottom)
								.offset(y: size.height + safeArea.top)
					}
						.aspectRatio(contentMode: .fill)
						.frame(width: size.width, height: size.height + (minY > 0 ? minY : 0))
						.offset(y: -minY)
				}
				
				GeometryReader { proxy in
					let size = proxy.size
					let minY = proxy.frame(in: .named("MYMUSICSCROLLVIEW")).minY
					
					Button {
						print("PLAY")
					} label: {
						Image(systemName: "play.circle.fill")
							.bold()
							.font(.largeTitle)
							.foregroundColor(.indigo)
					}
					.frame(maxWidth: .infinity, alignment: .trailing)
					.offset(y: minY < 50 ? -(minY - 50) : 0)
					.padding(.horizontal)
				}
				.frame(height: 50)
			}
		}
		.coordinateSpace(name: "MYMUSICSCROLLVIEW")
	}
	
	private var headerSectionInfo: some View {
		VStack(alignment: .leading, spacing: 5) {
			Text("좋아요 표시한 곡")
				.font(.title)
				.bold()
			
			HStack {
				Image(systemName: "star")
				
				Text("이승준 + Spotify")
					.font(.subheadline)
					.bold()
			}
			
			Text("172곡")
				.bold()
				.foregroundColor(.gray)
				.font(.footnote)
		}
		.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
	}
	
	private var recommendationButton: some View {
		Button {
			print("SONG RECOMMENDATION")
		} label: {
			HStack {
				Image(systemName: "star.fill")
					.foregroundColor(.indigo)
				
				Text("추천 곡 추가됨")
			}
			.bold()
			.font(.callout)
			.foregroundColor(.white)
		}
		.padding(3)
		.padding(.horizontal, 10)
		.overlay {
			Capsule()
				.stroke(Color.white, lineWidth: 2)
		}
	}
	
	private var shuffleButton: some View {
		Button {
			print("SHUFFLE BUTTON")
		} label: {
			Image(systemName: "shuffle")
				.bold()
				.font(.headline)
				.foregroundColor(.gray)
		}
	}
	
	private var likeAndEllipsisButtons: some View {
		Group {
			Button {
				print("FILL, CHANGE COLOR")
			} label: {
				Image(systemName: "heart")
					.foregroundColor(.gray)
			}
			
			Image(systemName: "ellipsis")
		}
		.padding(.horizontal, 5)
	}
	
	private var gradientBackground: some View {
		Color.indigo
			.overlay {
				LinearGradient(colors: [
					.indigo.opacity(0),
					.indigo.opacity(0.3),
					.indigo.opacity(0.5),
					.indigo.opacity(0.7),
					.indigo.opacity(0.9),
					.indigo.opacity(1),
				], startPoint: .top, endPoint: .bottom)
			}
	}
	
	@ViewBuilder
	private func songInformationBuilder(index: Int) -> some View {
		VStack(alignment: .leading, spacing: 7) {
			Text("\(albums[index].albumName)")
				.bold()
				.font(.headline)
			
			Text("HYBS")
				.bold()
				.font(.caption)
				.foregroundColor(.gray)
		}
		.lineLimit(1)
	}
}

struct MainListView_Previews: PreviewProvider {
	static var previews: some View {
		MyListView()
	}
}

//				VStack(alignment: .leading) {
//					Group {
//						headerSectionInfo
//
//						HStack {
//							recommendationButton
//
//							Spacer()
//
//							shuffleButton
//
//							Button {
//								print("PLAY")
//							} label: {
//								Image(systemName: "play.circle.fill")
//									.bold()
//									.font(.largeTitle)
//									.foregroundColor(.indigo)
//							}
//						}
//					}
//					.padding(.vertical, 1)
//
//					// MARK: List View
//					ForEach(albums.indices, id: \.self) { index in
//						HStack(spacing: 10) {
//							// MARK: Cover Images
//							Image("HYBS")
//								.resizable()
//								.frame(width: 60, height: 60)
//								.aspectRatio(1, contentMode: .fit)
//
//							// MARK: Song Name, Artist
//							songInformationBuilder(index: index)
//
//							Spacer()
//
//							// MARK: Liked, Ellipsis
//							likeAndEllipsisButtons
//
//						}
//
//						.frame(maxWidth: .infinity, alignment: .leading)
//					}
//					.padding(.vertical, 5)
//				}
//				.padding(.horizontal)
//				.background(alignment: .top) {
//					gradientBackground
//						.frame(height: viewSize.height / 4)
//				}
