//
//  HomeViewController.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import UIKit

final class HomeViewController: UIViewController {

	// MARK: - HomeViewControllerProtocol properties

	var presenter: HomeViewControllerOutputProtocol
	var moduleView: HomeViewInputProtocol

	let table: UITableView = UITableView()

	lazy var menuBar: HomeMenuBar = {
		let mb = HomeMenuBar()
		mb.parent = self
		return mb
	}()

	var data: [HomeStocksModel] = []

	private let titles: [String] = ["Stonks", "Favorite"]

	// MARK: - Init

	init(presenter: HomeViewControllerOutputProtocol, view: HomeViewInputProtocol) {
		self.presenter = presenter
		self.moduleView = view
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		view.addSubview(table)
		table.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			table.topAnchor.constraint(equalTo: view.topAnchor),
			table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])

		table.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
		table.delegate = self
		table.dataSource = self
		table.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)

		setupTitleLabel()
		setupSearchBar()
		setupMenuBar()

		presenter.viewDidLoad()
	}

	override func loadView() {
		self.view = moduleView
	}

	func setupTitleLabel() {
		let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 32, height: UIScreen.main.bounds.height))

		titleLabel.text = "  Stonks"
		titleLabel.font = UIFont.systemFont(ofSize: 20)
		titleLabel.textColor = .white
		navigationItem.titleView = titleLabel
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

	private func setupMenuBar() {
		navigationController?.hidesBarsOnSwipe = true

		let redView = UIView()
		view.addSubview(redView)
		redView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			redView.topAnchor.constraint(equalTo: view.topAnchor),
			redView.heightAnchor.constraint(equalToConstant: 95),
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

	@objc func handleSearch() {
		print("123")
	}

	private func setTitleForIndex(index: Int) {
		if let titleLabel = navigationItem.titleView as? UILabel {
			titleLabel.text = "  \(titles[Int(index)])"
		}
	}
}

// MARK: - HomeViewControllerProtocol

extension HomeViewController: HomeViewControllerProtocol {
}

// MARK: - HomeViewDelegate

extension HomeViewController: HomeViewDelegate { }

// MARK: - HomeViewDataSource

extension HomeViewController: HomeViewDataSource {
	
}

// MARK: - HomeViewControllerInputProtocol

extension HomeViewController: HomeViewControllerInputProtocol {

	func getHomeModel(models: [HomeStocksModel]) {
		data = models
		table.reloadData()
	}
}

// MARK: - UITableViewDataSource

extension HomeViewController: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return data.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath)

		guard let customCell = cell as? HomeTableViewCell else {
			return UITableViewCell()
		}

		if indexPath.row % 2 == 0 { customCell.backgroundColor = UIColor.init(red: 240/255, green: 240/255, blue: 240/255, alpha: 1) }

		customCell.stock = data[indexPath.row]

		return customCell
	}
}

// MARK: - UITableViewDelegate

extension HomeViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
		print(indexPath.item)
		let closeAction = UIContextualAction(style: .normal, title:  "В Избранное", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
			 print("OK, marked as Closed")
			 success(true)
		 })
		 closeAction.image = UIImage(named: "tick")
		 closeAction.backgroundColor = .orange
		
		return UISwipeActionsConfiguration(actions: [closeAction])
	}
}
