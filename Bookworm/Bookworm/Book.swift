//
//  Book.swift
//  Bookworm
//
//  Created by Julia Martcenko on 23/02/2025.
//

import Foundation
import SwiftData

@Model
class Book {
	var title: String
	var author: String
	var genre: String
	var review: String
	var rating: Int
	var date: Date

	init(title: String, author: String, genre: String, review: String, rating: Int, date: Date) {
		self.title = title
		self.author = author
		self.genre = genre
		self.review = review
		self.rating = rating
		self.date = date
	}
}
