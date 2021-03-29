//
//  HomeAssemblyProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import UIKit

/// Описание сборщика модуля
protocol HomeAssemblyProtocol: AnyObject {

	///	собрать модуль
	static func module () -> UIViewController
}
