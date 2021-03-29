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

	// MARK: - Init

	init(presenter: HomeViewControllerOutputProtocol, view: HomeViewInputProtocol) {
		self.presenter = presenter
		self.moduleView = view
		super.init(nibName: nil, bundle: nil)

		print("viewcontroller init")
		title = "Stonks"
	}

	deinit {
		print("viewcontroller deinit")
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	override func loadView() {
		self.view = moduleView
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

extension HomeViewController: HomeViewControllerInputProtocol { }
