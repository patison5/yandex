//
//  SinglePresenterProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 10.04.2021.
//

import Foundation

protocol SinglePresenterProtocol: AnyObject {
	
	/// Интерактор моделуя
	var interactor: SingleInteractorInputProtocol { get set }
	
	/// Маршрутизатор модуля
	var router: SingleRouterProtocol { get set }
	
	/// Контроллер модуля
	var controller: SingleViewControllerInputProtocol? { get set }
}
