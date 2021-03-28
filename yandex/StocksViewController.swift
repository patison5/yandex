//
//  StocksViewController.swift
//  yandex
//
//  Created by Fedor Penin on 23.03.2021.
//

import UIKit

//final class StocksViewController: UIViewController {
//
//	var collectionView = StocksCollectionView()
//
//	override func viewDidLoad() {
//		super.viewDidLoad()
//
//		view.backgroundColor = .cyan
//
//		setupViews()
//		setupConstraints()
//	}
//
//	private func setupViews() {
//		[collectionView].forEach {
//			view.addSubview($0)
//			$0.translatesAutoresizingMaskIntoConstraints = false
//		}
//	}
//
//	private func setupConstraints () {
//		NSLayoutConstraint.activate([
//			collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//			collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//			collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//			collectionView.topAnchor.constraint(equalTo: view.topAnchor),
//		])
//	}
//}

class StocksViewController: UIViewController {

	// MARK: - Public properties

	// MARK: - Private properties

	private weak var collectionView: UICollectionView!
	private var data: [Int] = Array(0..<20)

	private let menuBar: MenuBar = {
		let mb = MenuBar()
		return mb
	}()

	// MARK: - Override

	override func loadView() {
		super.loadView()

		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

		self.view.addSubview(collectionView)

		collectionView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			self.view.topAnchor.constraint(equalTo: collectionView.topAnchor),
			self.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
			self.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
			self.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
		])
		self.collectionView = collectionView
		
		collectionView.backgroundColor = .cyan
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "Home"
		navigationController?.navigationBar.isTranslucent = false
		
		let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
		titleLabel.text = "Home"
		titleLabel.font = UIFont.systemFont(ofSize: 20)
		titleLabel.textColor = .white
		navigationItem.titleView = titleLabel

		self.collectionView.dataSource = self
		self.collectionView.delegate = self
		self.collectionView.register(StocksCollectionViewCell.self, forCellWithReuseIdentifier: StocksCollectionViewCell.identifier)
		self.collectionView.alwaysBounceVertical = true
		self.collectionView.backgroundColor = .white
		self.collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
		self.collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
		
		setupMenuBar()
	}
}

// MARK: - UICollectionViewDataSource

extension StocksViewController: UICollectionViewDataSource {

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.data.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StocksCollectionViewCell.identifier, for: indexPath) as! StocksCollectionViewCell
//		let data = self.data[indexPath.item]
		
		if indexPath.row % 2 == 0 {
			cell.backgroundColor = UIColor.init(red: 244/255, green: 240/255, blue: 247/255, alpha: 1)
		} else {
			cell.backgroundColor = .white
		}
		return cell
	}
}

// MARK: - UICollectionViewDelegate

extension StocksViewController: UICollectionViewDelegate {

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

	}
}

// MARK: - UICollectionViewDelegateFlowLayout

extension StocksViewController: UICollectionViewDelegateFlowLayout {

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
}

// MARK: - Private functions

extension StocksViewController {

	private func setupViews() {
		
	}

	private func setupConstrints() {
		
	}

	private func setupMenuBar() {
		navigationController?.hidesBarsOnSwipe = true

		let redView = UIView()
		view.addSubview(redView)
		redView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			redView.topAnchor.constraint(equalTo: view.topAnchor),
			redView.heightAnchor.constraint(equalToConstant: 50),
			redView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			redView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
		redView.backgroundColor = UIColor.init(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)

		view.addSubview(menuBar)
		menuBar.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			menuBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			menuBar.heightAnchor.constraint(equalToConstant: 50),
			menuBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			menuBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
		])
	}
}
