//
//  HomeAssembly.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import UIKit

final class HomeAssembly: HomeAssemblyProtocol {

	// MARK: - AssemblyProtocol methods

	static func module() -> UIViewController {
		let view = HomeView()
		let router = HomeRouter()
		let interactor = HomeInteractor()
		let presenter = HomePresenter(router: router, interactor: interactor)
		let controller = HomeViewController(presenter: presenter, view: view)

		interactor.presenter = presenter

		presenter.controller = controller
		presenter.router = router
		presenter.interactor = interactor

		controller.presenter = presenter
		controller.moduleView = view

		view.dataSource = controller
		view.delegate = controller
		
		router.controller = controller

		return controller
	}
}
