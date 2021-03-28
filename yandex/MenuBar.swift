//
//  MenuBar.swift
//  yandex
//
//  Created by Fedor Penin on 27.03.2021.
//

import UIKit

class MenuBar: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

	// MARK: - Private properties

	let cellId = "cellId"
	var horizontalLineLeftAnchor: NSLayoutConstraint?
	
	let menuIcons = ["home", "favorite"]
	
	var stocksViewController: StocksViewController?

	lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
		cv.backgroundColor = UIColor.init(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
		cv.delegate = self
		cv.dataSource = self
		return cv
	}()

	// MARK: - Init

	override init(frame: CGRect) {
		super.init(frame: frame)

		collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)

		addSubview(collectionView)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			collectionView.topAnchor.constraint(equalTo: topAnchor),
			collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
			collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
			collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
		])

		backgroundColor = UIColor.init(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)

		let selectedIndexPath = NSIndexPath(row: 0, section: 0)
		collectionView.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .top)

		setupHorizontalLine()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Private methods

extension MenuBar {
	func setupHorizontalLine() {
		let horizontalLine = UIView()
		horizontalLine.backgroundColor = UIColor(white: 0.9, alpha: 1)
		horizontalLine.translatesAutoresizingMaskIntoConstraints = false
		addSubview(horizontalLine)
		
		horizontalLineLeftAnchor = horizontalLine.leftAnchor.constraint(equalTo: self.leftAnchor)
		horizontalLineLeftAnchor?.isActive = true

		NSLayoutConstraint.activate([
			horizontalLine.bottomAnchor.constraint(equalTo: self.bottomAnchor),
			horizontalLine.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/2),
			horizontalLine.heightAnchor.constraint(equalToConstant: 5)
		])
	}
}

// MARK: - UICollectionView extensions

extension MenuBar {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 2
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
//		cell.imageView.image = UIImage(named: menuIcons[indexPath.item])
//		cell.imageView.tintColor = UIColor.init(red: 91/255, green: 14/255, blue: 13/255, alpha: 1)
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: frame.width / 2, height: frame.height)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0
	}

	// Клик по элементу меню
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//		let x = CGFloat(indexPath.item) * frame.width / 2
//		horizontalLineLeftAnchor?.constant = x
//
//		UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//			self.layoutIfNeeded()
//		}, completion: nil)

		stocksViewController?.scrollToMenuIntdex(menuIndex: indexPath.item)
	}
}
