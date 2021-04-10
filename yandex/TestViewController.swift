//
//  TestViewController.swift
//  yandex
//
//  Created by Fedor Penin on 08.04.2021.
//

import UIKit

class TestViewController: UIViewController {
	
	init(id: Int) {
		super.init(nibName: nil, bundle: nil)
		view.backgroundColor = .cyan
		print("id is : \(id)")
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .red
	}
}
