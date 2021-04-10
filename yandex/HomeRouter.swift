//
//  HomeRouter.swift
//  yandex
//
//  Created by Fedor Penin on 29.03.2021.
//

import UIKit

final class HomeRouter: HomeRouterProtocol {

	weak var controller: UIViewController?

	func showSinglePage(id: Int?) {
		guard let id = id else { return }
		print(id)

		let sv = SingleAssembly.module()
//		let tv = TestViewController(id: 5)
		controller?.navigationController?.pushViewController(sv, animated: true)
	}

	init() {}
}
