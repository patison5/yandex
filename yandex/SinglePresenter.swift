//
//  SinglePresenter.swift
//  yandex
//
//  Created by Fedor Penin on 10.04.2021.
//

import Foundation

final class SinglePresenter: SinglePresenterProtocol {

	// MARK: - Public properties

	var interactor: SingleInteractorInputProtocol
	var router: SingleRouterProtocol
	weak var controller: SingleViewControllerInputProtocol?

	// MARK: - Init

	/// Иницализатор
	/// - Parameters:
	///   - router: Маршрушизатор
	///   - interactor: Интерактор
	init(router: SingleRouterProtocol, interactor: SingleInteractorInputProtocol) {
		self.router = router
		self.interactor = interactor
	}
}

extension SinglePresenter: SingleInteractorOutputProtocol {

}

extension SinglePresenter: SingleViewControllerOutputProtocol {

}
