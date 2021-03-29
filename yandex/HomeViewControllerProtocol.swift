//
//  HomeViewControllerProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import UIKit

/// Описание вью контроллера модуля
protocol HomeViewControllerProtocol where Self: UIViewController {

	/// Презентер модуля
	var presenter: HomeViewControllerOutputProtocol { get set }

	/// вьюха модуля
	var moduleView: HomeViewInputProtocol { get set }
}
