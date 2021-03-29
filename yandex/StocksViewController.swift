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
	private let titles: [String] = ["Stocks", "Favorite"]

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

//		fetchStocks()

		navigationItem.title = "  Stonks"
		navigationController?.navigationBar.isTranslucent = false

		let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
		titleLabel.text = "  Stonks"
		titleLabel.font = UIFont.systemFont(ofSize: 20)
		titleLabel.textColor = .white
		navigationItem.titleView = titleLabel

		setupCollectionView()
		setupMenuBar()
		setupSearchBar()
	}

	func setupSearchBar() {
		let menuBtn = UIButton(type: .custom)
		menuBtn.frame = CGRect(x: 0.0, y: 0.0, width: 20, height: 20)
		menuBtn.setImage(UIImage(named:"search")?.withRenderingMode(.alwaysTemplate), for: .normal)
		menuBtn.addTarget(self, action: #selector(handleSearch), for: .touchUpInside)
		menuBtn.tintColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)

		let menuBarItem = UIBarButtonItem(customView: menuBtn)
		let currWidth = menuBarItem.customView?.widthAnchor.constraint(equalToConstant: 24)
		currWidth?.isActive = true
		let currHeight = menuBarItem.customView?.heightAnchor.constraint(equalToConstant: 24)
		currHeight?.isActive = true
		self.navigationItem.rightBarButtonItem = menuBarItem
	}
	
	func fetchStocks() {
		let url = NSURL(string: "https://finnhub.io/api/v1/stock/symbol?exchange=US&token=c1d0lbf48v6p6471pmm0")
		URLSession.shared.dataTask(with: url! as URL) {
			(data, response, error) in
			if error != nil {
				print(error ?? "error response")
				return
			}

			let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
//			print(str)
		}.resume()
	}

	@objc func handleSearch() {
		print("123")
	}
	
	func setupCollectionView() {
		self.collectionView.dataSource = self
		self.collectionView.delegate = self
		self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
		self.collectionView.register(StocksPage.self, forCellWithReuseIdentifier: StocksPage.identifier)
		self.collectionView.register(FavoritePage.self, forCellWithReuseIdentifier: FavoritePage.identifier)
		self.collectionView.alwaysBounceVertical = true
		self.collectionView.backgroundColor = .white
		self.collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
		self.collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
		self.collectionView.isPagingEnabled = true
	}
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
		menuBar.horizontalLineLeftAnchor?.constant = scrollView.contentOffset.x / 2
	}

	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		let index = targetContentOffset.move().x / view.frame.width
		let indexPath = NSIndexPath(item: Int(index), section: 0)
		menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: .centeredHorizontally)

		setTitleForIndex(index: Int(index))
	}
}

// MARK: - UICollectionViewDataSource

extension StocksViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 2
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		var cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
		
		if indexPath.row == 0 {
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: StocksPage.identifier, for: indexPath)
		} else {
			cell = collectionView.dequeueReusableCell(withReuseIdentifier: FavoritePage.identifier, for: indexPath)
		}

		return cell
	}
}

// MARK: - UICollectionViewDelegate

extension StocksViewController: UICollectionViewDelegate { }

// MARK: - UICollectionViewDelegateFlowLayout

extension StocksViewController: UICollectionViewDelegateFlowLayout {

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//		return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
		return CGSize(width: view.frame.width, height: view.frame.height - 70)
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

		setTitleForIndex(index: menuIndex)
	}
	
	private func setTitleForIndex(index: Int) {
		if let titleLabel = navigationItem.titleView as? UILabel {
			titleLabel.text = "  \(titles[Int(index)])"
		}
	}
}
