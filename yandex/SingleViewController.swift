//
//  SingleViewController.swift
//  yandex
//
//  Created by Fedor Penin on 10.04.2021.
//

import UIKit

final class SingleViewController: UIViewController {

	var presenter: SingleViewControllerOutputProtocol

	// MARK: - Init

	init(presenter: SingleViewControllerOutputProtocol) {
		self.presenter = presenter
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		view.backgroundColor = .cyan
		title = "WTF"
	}
}

extension SingleViewController: SingleViewControllerProtocol {

}

extension SingleViewController: SingleViewControllerInputProtocol {

}
