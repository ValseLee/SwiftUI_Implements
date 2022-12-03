//
//  AlbumModels.swift
//  PracticingModernUI
//
//  Created by 이승준 on 2022/12/03.
//

import Foundation

struct AlbumModels {
	var id = UUID().uuidString
	var albumName: String
}

var albums: [AlbumModels] = [
	AlbumModels(albumName: "No One"),
	AlbumModels(albumName: "Making Steak"),
	AlbumModels(albumName: "Killer"),
	AlbumModels(albumName: "Go Higher"),
	AlbumModels(albumName: "Ride"),
	AlbumModels(albumName: "Dancing with my phone"),
	AlbumModels(albumName: "No One"),
	AlbumModels(albumName: "Making Steak"),
	AlbumModels(albumName: "Killer"),
	AlbumModels(albumName: "Go Higher"),
	AlbumModels(albumName: "Ride"),
	AlbumModels(albumName: "Dancing with my phone"),
]
