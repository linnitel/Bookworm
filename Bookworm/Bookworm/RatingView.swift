//
//  RatingView.swift
//  Bookworm
//
//  Created by Julia Martcenko on 23/02/2025.
//

import SwiftUI

struct RatingView: View {
	@Binding var rating: Int

	var lable: String = ""
	var maxRating: Int = 5

	var offImage: Image?
	var onImage = Image(systemName: "star.fill")

	var offColor: Color = .gray
	var onColor: Color = .yellow

    var body: some View {
		HStack {
			if lable.isEmpty == false {
				Text(lable)
			}

			ForEach(1..<maxRating + 1, id: \.self) { number in
				Button {
					rating = number
				} label: {
					image(for: number)
						.foregroundStyle(number > rating ? offColor : onColor)
				}
			}
		}
		.buttonStyle(.plain)
    }

	func image(for number: Int) -> Image {
		if number > rating {
			offImage ?? onImage
		} else {
			onImage
		}
	}
}

#Preview {
	RatingView(rating: .constant(4))
}
