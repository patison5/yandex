//
//  HomeRouterProtocol.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import UIKit

protocol HomeRouterProtocol: AnyObject {

	var controller: UIViewController? { get set }

	func showSinglePage(id: Int?)
}
