//
//  AddBookView.swift
//  Bookworm
//
//  Created by Julia Martcenko on 23/02/2025.
//

import SwiftUI

struct AddBookView: View {
	@Environment(\.modelContext) var modelContext
	@Environment(\.dismiss) var dismiss

	@State private var title = ""
	@State private var author = ""
	@State private var rating = 3
	@State private var genre = "Fantasy"
	@State private var review = ""
	@State private var date = Date.now

	let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    var body: some View {
		NavigationStack {
			Form {
				Section {
					TextField("Name of book", text: $title)
					TextField("Author's name", text: $author)

					Picker("Genre", selection: $genre) {
						ForEach(genres, id: \.self) {
							Text($0)
						}
					}
				}
				Section("Write a review") {
					TextEditor(text: $review)
					RatingView(rating: $rating)
				}

				Section(hasValidAddress() == false ? "Please specify title and author of the book" : "") {
					Button("Save") {
						let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: date)
						modelContext.insert(newBook)
						dismiss()
					}
					.disabled(hasValidAddress() == false)
				}
			}
			.navigationTitle("Add Book")
		}
    }

	func hasValidAddress() -> Bool {
		!title.isEmpty && !author.isEmpty
	}
}

#Preview {
    AddBookView()
}
