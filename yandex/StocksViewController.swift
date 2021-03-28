//
//  StocksViewController.swift
//  yandex
//
//  Created by Fedor Penin on 23.03.2021.
//

import UIKit

class StocksViewController: UIViewController {

	// MARK: - Public properties

	// MARK: - Private properties

	private weak var collectionView: UICollectionView!
	private var data: [Int] = Array(0..<20)

	lazy var menuBar: MenuBar = {
		let mb = MenuBar()
		mb.stocksViewController = self
		return mb
	}()
	
	let cellId = "cellId"

	// MARK: - Override

	override func loadView() {
		super.loadView()

		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		layout.minimumLineSpacing = 0
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)

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
		
		setupCollectionView()
		setupMenuBar()
	}
	
	

	func setupCollectionView() {
		self.collectionView.dataSource = self
		self.collectionView.delegate = self
//		self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
//		self.collectionView.register(StocksCollectionViewCell.self, forCellWithReuseIdentifier: StocksCollectionViewCell.identifier)
		self.collectionView.register(StocksPage.self, forCellWithReuseIdentifier: cellId)
		self.collectionView.alwaysBounceVertical = true
		self.collectionView.backgroundColor = .white
		self.collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
		self.collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
		self.collectionView.isPagingEnabled = true
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		print(scrollView.contentOffset.x)
		menuBar.horizontalLineLeftAnchor?.constant = scrollView.contentOffset.x / 2
	}
	
	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		let index = targetContentOffset.move().x / view.frame.width
		let indexPath = NSIndexPath(item: Int(index), section: 0)
		menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: .centeredHorizontally)
	}
}

// MARK: - UICollectionViewDataSource

extension StocksViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 2
	}

//	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//		return self.data.count
//	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
		return cell
	}
}

// MARK: - UICollectionViewDelegate

extension StocksViewController: UICollectionViewDelegate { }

// MARK: - UICollectionViewDelegateFlowLayout

extension StocksViewController: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//		return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
		return CGSize(width: view.frame.width, height: view.frame.height - 50)
	}
}

// MARK: - Private functions

extension StocksViewController {

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

	func scrollToMenuIntdex(menuIndex: Int) {
		let indexPath = NSIndexPath(item: menuIndex, section: 0)

		self.collectionView.isPagingEnabled = false // fix ios 13-14 bug
		self.collectionView.scrollToItem(at: indexPath as IndexPath, at: .left, animated: true)
		self.collectionView.isPagingEnabled = true
	}
}
