//
//  HomePresenterProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

protocol HomePresenterProtocol: AnyObject {

	/// Интерактор модуля
	var interactor: HomeInteractorInputProtocol { get set }

	/// Маршрутизатор модуля
	var router: HomeRouterProtocol { get set }

	/// Контроллер модуля
	var controller: HomeViewControllerInputProtocol? { get set }
}
