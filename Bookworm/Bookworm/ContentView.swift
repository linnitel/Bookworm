//
//  ContentView.swift
//  Bookworm
//
//  Created by Julia Martcenko on 23/02/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
	@Environment(\.modelContext) var modelContext
	@Query(sort: [
		SortDescriptor(\Book.title),
		SortDescriptor(\Book.author)
	]) var books: [Book]

	@State private var showingAddBookSheet = false

    var body: some View {
		NavigationStack {
			List {
				ForEach(books) { book in
					NavigationLink(value: book) {
						HStack {
							EmojiRatingView(rating: book.rating)
								.font(.largeTitle)
							VStack(alignment: .leading) {
									Text(book.title)
										.font(.headline)
										.foregroundStyle(book.rating == 1 ? .red : .black)
								Text(book.author)
									.foregroundStyle(.secondary)
							}
						}
					}
				}
				.onDelete(perform: deleteBook)
			}
			.navigationTitle("Bookworm")
			.navigationDestination(for: Book.self) { book in
				DetailView(book: book)
			}
			.toolbar {
				ToolbarItem(placement: .topBarLeading) {
					EditButton()
				}

				ToolbarItem(placement: .topBarTrailing) {
					Button("Add book", systemImage: "plus") {
						showingAddBookSheet.toggle()
					}
				}
			}
			.sheet(isPresented: $showingAddBookSheet) {
				AddBookView()
			}
		}
	}

	func deleteBook(at offsets: IndexSet) {
		for offset in offsets {
			let book = books[offset]
			modelContext.delete(book)
		}

	}
}

#Preview {
    ContentView()
}
