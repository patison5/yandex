//
//  SingleAssembly.swift
//  yandex
//
//  Created by Fedor Penin on 10.04.2021.
//

import UIKit

final class SingleAssembly: SingleAssemblyProtocol {

	// MARK: - AssemblyProtocol methods

	static func module() -> UIViewController {
		let router = SingleRouter()
		let interactor = SingleInteractor()
		let presenter = SinglePresenter(router: router, interactor: interactor)
		let controller = SingleViewController(presenter: presenter)

		interactor.presenter = presenter
		presenter.controller = controller
		presenter.router = router
		presenter.interactor = interactor
		controller.presenter = presenter

		return controller
	}
}
