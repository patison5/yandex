//
//  StocksPage.swift
//  yandex
//
//  Created by Fedor Penin on 28.03.2021.
//

import UIKit

class StocksPage: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

	static var identifier: String = "StocksPageCell"

	var stocksData: [Stock] = {
		let stockAAPL = Stock()
		stockAAPL.currentPrice = "131.93$"
		stockAAPL.priceDelta = "+$0.12 (1,15%)"
		stockAAPL.title = "AAPL"
		stockAAPL.titleDescription = "Apple Inc."
		stockAAPL.thumbnailImageName = "AAPL"

		let stockYNDX = Stock()
		stockYNDX.currentPrice = "4 764,6 ₽"
		stockYNDX.priceDelta = "+55 ₽ (1,15%)"
		stockYNDX.title = "YNDX"
		stockYNDX.titleDescription = "Yandex, LLC"
		stockYNDX.thumbnailImageName = "YNDX"

		let stockGoogle = Stock()
		stockGoogle.currentPrice = "$1 825"
		stockGoogle.priceDelta = "+$0.12 (1,15%)"
		stockGoogle.title = "GOOGLE"
		stockGoogle.titleDescription = "Alphabet Class A"
		stockGoogle.thumbnailImageName = "GOOGL"

		return [stockAAPL, stockYNDX, stockGoogle, stockAAPL, stockYNDX, stockGoogle]
	}()

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return stocksData.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! StocksCollectionViewCell

		cell.stock = stocksData[indexPath.item]

		if indexPath.item % 2 == 0 {
			cell.backgroundColor = UIColor.init(red: 244/255, green: 240/255, blue: 247/255, alpha: 1)
		} else {
			cell.backgroundColor = .white
		}

		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.bounds.width, height: 68)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0) //.zero
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}

	let cellId = "cellId"

	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = .white
		cv.dataSource = self
		cv.delegate = self
		return cv
	}()

	override init(frame: CGRect) {
		super.init(frame: frame)

		addSubview(collectionView)

		collectionView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
			collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
		])
		backgroundColor = .yellow
		
		collectionView.register(StocksCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
