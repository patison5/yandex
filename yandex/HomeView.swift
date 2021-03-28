//
//  HomeView.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import UIKit

final class HomeView: UIView, HomeViewProtocol {

	// MARK: - HomeViewProtocol properties

	weak var dataSource: HomeViewDataSource?
	weak var delegate: HomeViewDelegate?

	// MARK: - Init

	init() {
		super.init(frame: .zero)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - HomeViewInputProtocol

extension HomeView: HomeViewInputProtocol { }
