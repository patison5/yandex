//
//  HomeInteractor.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import UIKit

final class HomeInteractor: HomeInteractorProtocol {
	
	/// Презентер модуля
	weak var presenter: HomeInteractorOutputProtocol?

	init() {
		print("interactor init")
	}

	deinit {
		print("interactor deinit")
	}
}

// MARK: - HomeInteractorProtocol

extension HomeInteractor: HomeInteractorInputProtocol { }
