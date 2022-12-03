//
//  MainHome.swift
//  PracticingModernUI
//
//  Created by 이승준 on 2022/12/03.
//

import SwiftUI

struct MainHome: View {
	var safeArea: EdgeInsets
	var size: CGSize
	
	var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack {
				ArtWorkBuilder()
				
				GeometryReader { proxy in
					let minY = proxy.frame(in: .named("HOMESCROLL")).minY - safeArea.top
					Button {
						print()
					} label: {
						Text("Play")
							.font(.callout)
							.bold()
							.foregroundColor(.white)
							.padding(.horizontal, 45)
							.padding(.vertical, 12)
							.background {
								Capsule()
									.fill(Color(.systemGray4)
										.gradient)
							}
					}
					.frame(maxWidth: .infinity, maxHeight: .infinity)
					.offset(y: minY < 50 ? -(minY - 50) : 0)
				}
				.frame(height: 50)
				.padding(.top, -34)
				.zIndex(1)
				
				VStack {
					Text("Popular")
						.bold()
					
					// MARK: Album List
					AlbumListBuilder()
				}
				.padding(.top, 10)
				.zIndex(0)
			}
			.overlay(alignment: .top) {
				headerViewBuilder()
			}
		}
		.coordinateSpace(name: "HOMESCROLL")
	}
	
	@ViewBuilder
	private	func ArtWorkBuilder() -> some View {
		let height = size.height * 0.5
		
		GeometryReader { proxy in
			let size = proxy.size
			let minY = proxy.frame(in: .named("HOMESCROLL")).minY
			let progress = minY / height * (minY > 0 ? 0.5 : 0.8)
			
			Image("HYBS")
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: size.width,
					   height: size.height + (minY > 0 ? minY : 0))
				.clipped()
				.overlay {
					ZStack(alignment: .bottom) {
						Rectangle()
							.fill(
								.linearGradient(colors: [
									.black.opacity(0 - progress),
									.black.opacity(0.1 - progress),
									.black.opacity(0.3 - progress),
									.black.opacity(0.5 - progress),
									.black.opacity(0.8 - progress),
									.black.opacity(1)
								], startPoint: .top, endPoint: .bottom)
							)
						
						VStack(spacing: 0) {
							Text("HYBS")
								.font(.title)
								.multilineTextAlignment(.center)
								.bold()
							
							Text("175,224 Monthly Listened")
								.font(.caption)
								.foregroundColor(Color(.systemGray))
								.bold()
						}
						.opacity(1 + (progress > 0 ? -progress : progress))
						.padding(.bottom, 45)
						.offset(y: minY < 0 ? minY : 0)
					}
				}
				.offset(y: -minY)
		}
		.frame(height: height + safeArea.top)
	}
	
	@ViewBuilder
	private func AlbumListBuilder() -> some View {
		VStack(spacing: 25) {
			ForEach(albums.indices, id: \.self) { index in
				HStack(spacing: 25) {
					Text("\(index + 1)")
						.font(.callout)
						.bold()
						.foregroundColor(.white)
					
					VStack(alignment: .leading) {
						Text(albums[index].albumName)
							.bold()
							.foregroundColor(.white)
						
						Text("\(Int.random(in: 3000...15000))")
							.font(.caption)
							.foregroundColor(Color(.systemGray))
					}
					.frame(maxWidth: .infinity, alignment: .leading)
					
					Image(systemName: "ellipsis")
						.foregroundColor(.gray)
				}
			}
		}
		.padding(15)
	}
	
	@ViewBuilder
	private func headerViewBuilder() -> some View {
		GeometryReader { proxy in
			let minY = proxy.frame(in: .named("HOME_SCROLL")).minY
			let height = size.height * 0.45
			
			let titleProgress = minY / height
			let progress = minY / height * (minY > 0 ? 0.5 : 0.8)
			
			HStack(spacing: 15) {
				Button {
					
				} label: {
					Image(systemName: "chevron.left")
						.font(.title3)
						.foregroundColor(.white)
				}
				
				Spacer(minLength: 0)
				
				Button {
					
				} label: {
					Text("Follow")
						.font(.caption)
						.bold()
						.foregroundColor(.white)
						.padding(.horizontal, 10)
						.padding(.vertical, 6)
						.border(.white, width: 1.5)
				}
				.opacity(1.0 + progress * 1.1)
				
				Button {
					
				} label: {
					Image(systemName: "ellipsis")
						.font(.title3)
						.foregroundColor(.white)
				}
				
			}
			.overlay {
				Text("HYBS")
					.bold()
					.offset(y: -titleProgress > 1 ? 0 : 45)
					.opacity(-titleProgress > 1 ? 1 : 0)
					.animation(.easeInOut(duration: 0.25), value: -titleProgress > 1)
			}
			.padding(.top, safeArea.top + 10)
			.padding([.horizontal, .bottom], 15)
			.background {
				Color.black
					.opacity(-progress > 0.9 ? 1 : 0)
			}
			.offset(y: -minY)
		}
		.frame(height: 35)
	}
}

struct MainHome_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
