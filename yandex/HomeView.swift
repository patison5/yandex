//
//  HomeView.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import UIKit

final class HomeView: UIView {

	// MARK: - HomeViewProtocol properties

	weak var dataSource: HomeViewDataSource?
	weak var delegate: HomeViewDelegate?

	// MARK: - Init

	init() {
		super.init(frame: .zero)

		print("View init")
	}

	deinit {
		print("view deinit")
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - HomeViewProtocol

extension HomeView: HomeViewProtocol {
	
}

// MARK: - HomeViewInputProtocol

extension HomeView: HomeViewInputProtocol { }
