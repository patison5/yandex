//
//  StocksCollectionViewCell.swift
//  yandex
//
//  Created by Fedor Penin on 27.03.2021.
//

import UIKit

class StocksCollectionViewCell: UICollectionViewCell {

	static var identifier: String = "Cell"
	
	var stock: Stock? {
		didSet {
			titleView.text = stock?.title
			subtitleView.text = stock?.titleDescription
			stockPrice.text = stock?.currentPrice
			stockPriceChanging.text = stock?.priceDelta

			if let stockImageName = stock?.thumbnailImageName {
				stockImageView.image = UIImage(named: stockImageName)
			}
		}
	}

	let stockImageView: UIImageView  = {
		let imageView = UIImageView(image: UIImage(named: "YNDX.png")!)
		imageView.layer.cornerRadius = 10.0
		imageView.layer.masksToBounds = true
		return imageView
	}()

	let titleView: UITextView = {
		let textView = UITextView()
		textView.backgroundColor = .none
		textView.text = "YNDX"
		textView.font = UIFont.boldSystemFont(ofSize: 16.0)
		textView.textColor = UIColor.init(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
		textView.isEditable = false
		textView.isScrollEnabled = false
		return textView
	}()

	let subtitleView: UITextView = {
		let textView = UITextView()
		textView.backgroundColor = .none
		textView.text = "Yandex, LLC"
		textView.textColor = UIColor.init(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
		textView.isEditable = false
		textView.isScrollEnabled = false
		return textView
	}()

	let stockPrice: UITextView = {
		let textView = UITextView()
		textView.backgroundColor = .none
		textView.text = "4 764,6 ₽"
		textView.textColor = UIColor.init(red: 50/255, green: 50/255, blue: 50/255, alpha: 1)
		textView.isEditable = false
		textView.isScrollEnabled = false
		textView.font = UIFont.boldSystemFont(ofSize: 16.0)
		return textView
	}()

	let stockPriceChanging: UITextView = {
		let textView = UITextView()
		textView.backgroundColor = .none
		textView.text = "+55 ₽ (1,15%)"
		textView.isEditable = false
		textView.isScrollEnabled = false
		textView.textColor = UIColor.init(red: 36/255, green: 178/255, blue: 93/255, alpha: 1)
		return textView
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		backgroundColor = .yellow

		setupView()
		setupConstraints()
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func prepareForReuse() {
		super.prepareForReuse()
	}

	func setupView() {
		[stockImageView, titleView, subtitleView, stockPrice, stockPriceChanging].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			self.contentView.addSubview($0)
		}
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([
			stockImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			stockImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
			stockImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
			stockImageView.widthAnchor.constraint(equalToConstant: 52),

			titleView.leadingAnchor.constraint(equalTo: stockImageView.trailingAnchor, constant: 8),
//			titleView.widthAnchor.constraint(equalToConstant: 160),
			titleView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			titleView.heightAnchor.constraint(equalToConstant: 24),

			subtitleView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 0),
//			subtitleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
			subtitleView.heightAnchor.constraint(equalToConstant: 20),
			subtitleView.leadingAnchor.constraint(equalTo: stockImageView.trailingAnchor, constant: 8),
//			subtitleView.widthAnchor.constraint(equalToConstant: 160),

			stockPrice.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
			stockPrice.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			stockPrice.heightAnchor.constraint(equalToConstant: 24),
			
			stockPriceChanging.topAnchor.constraint(equalTo: stockPrice.bottomAnchor, constant: 0),
//			subtitleView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8),
			stockPriceChanging.heightAnchor.constraint(equalToConstant: 20),
			stockPriceChanging.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
//			subtitleView.widthAnchor.constraint(equalToConstant: 160),
		])
	}
}
