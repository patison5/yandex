//
//  HomeTableViewCell.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

	static var identifier: String = "HomeTableViewCell"

	var stock: StockModel? {
		didSet {
			titleView.text = stock?.title
			subtitleView.text = stock?.titleDescription
			stockPrice.text = stock?.currentPriceFormatted

			if let priceDelta = stock?.priceDeltaFormatted {
				stockPriceChanging.text = priceDelta

				if priceDelta.prefix(1) == "-" {
					stockPriceChanging.textColor = UIColor.init(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
				} else {
					stockPriceChanging.textColor = UIColor.init(red: 36/255, green: 178/255, blue: 93/255, alpha: 1)
				}
			}

			if let stockImageName = stock?.thumbnailImageName {
				let url = NSURL(string: stockImageName)
				if let url = url {
					stockImageView.loadFromUrl(url: url as URL)
				}
			}
		}
	}

	let bg: UIView = {
		let bg = UIView()
		bg.layer.masksToBounds = true
		bg.layer.cornerRadius = 15
		return bg
	}()

	let stockImageView: CustomUIImageView  = {
		let imageView = CustomUIImageView(image: UIImage(named: "YNDX.png")!)
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

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)

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
		[bg, stockImageView, titleView, subtitleView, stockPrice, stockPriceChanging].forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			self.contentView.addSubview($0)
		}
	}

	func setupConstraints() {
		NSLayoutConstraint.activate([

			bg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
			bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
			bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
			bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),

			stockImageView.topAnchor.constraint(equalTo: bg.topAnchor, constant: 8),
			stockImageView.leadingAnchor.constraint(equalTo: bg.leadingAnchor, constant: 8),
			stockImageView.bottomAnchor.constraint(equalTo: bg.bottomAnchor, constant: -8),
			stockImageView.widthAnchor.constraint(equalToConstant: 52),

			titleView.leadingAnchor.constraint(equalTo: stockImageView.trailingAnchor, constant: 8),
			titleView.topAnchor.constraint(equalTo: bg.topAnchor, constant: 8),
			titleView.heightAnchor.constraint(equalToConstant: 24),

			subtitleView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
			subtitleView.heightAnchor.constraint(equalToConstant: 20),
			subtitleView.leadingAnchor.constraint(equalTo: stockImageView.trailingAnchor, constant: 8),

			stockPrice.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -8),
			stockPrice.topAnchor.constraint(equalTo: bg.topAnchor, constant: 8),
			stockPrice.heightAnchor.constraint(equalToConstant: 24),
			
			stockPriceChanging.topAnchor.constraint(equalTo: stockPrice.bottomAnchor),
			stockPriceChanging.heightAnchor.constraint(equalToConstant: 20),
			stockPriceChanging.trailingAnchor.constraint(equalTo: bg.trailingAnchor, constant: -8),
		])
	}
}
