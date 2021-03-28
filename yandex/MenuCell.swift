//
//  MenuCell.swift
//  yandex
//
//  Created by Fedor Penin on 28.03.2021.
//

import UIKit

class MenuCell: UICollectionViewCell {

	let imageView: UIImageView = {
//		if let myImage = UIImage(named: "home") {
//			let tintableImage = myImage.withRenderingMode(.alwaysTemplate)
//			let img = UIImageView(image: myImage)
//			img.image = tintableImage
//			img.tintColor = UIColor.init(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
//			return img
//		}
//		return UIImageView(frame: .zero)
		
		let iv = UIImageView()
		iv.image = UIImage(named: "home")?.withRenderingMode(.alwaysTemplate)
		iv.tintColor = UIColor.init(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
		return iv
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		setupViews()
		setupConstraints()
	}

	override var isHighlighted: Bool {
		didSet {
			print("FUCK THAT SHIT It IS HIGHLIGHTED")
			imageView.tintColor = isHighlighted ? .white : UIColor.init(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
		}
	}

	override var isSelected: Bool {
		didSet {
			print("FUCK THAT SHIT It IS SELECTED")
			imageView.tintColor = isSelected ? .white : UIColor.init(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	private func setupViews() {
		[imageView].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			addSubview($0)
		}
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			imageView.widthAnchor.constraint(equalToConstant: 28),
			imageView.heightAnchor.constraint(equalToConstant: 28)
		])

		addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
		addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
	}
}
