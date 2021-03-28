//
//  StocksCollectionView.swift
//  yandex
//
//  Created by Fedor Penin on 23.03.2021.
//

import UIKit

class StocksCollectionView: UICollectionView {
	let reuseIdentifier = "cell"

	init() {
		let layout = UICollectionViewFlowLayout()
		super.init(frame: .zero, collectionViewLayout: layout)
		
		register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
		backgroundColor = .yellow
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - UICollectionViewDataSource

extension StocksCollectionView: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
		cell.backgroundColor = .red

		return cell
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return .init(width: 120, height: 120)
	}
}

// MARK: - UICollectionViewDelegate

extension StocksCollectionView: UICollectionViewDelegate { }
