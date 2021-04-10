//
//  SingleAssemblyProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 10.04.2021.
//

import UIKit

protocol SingleAssemblyProtocol: AnyObject {

	///	собрать модуль
	static func module () -> UIViewController
}
