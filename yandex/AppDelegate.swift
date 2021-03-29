//
//  AppDelegate.swift
//  yandex
//
//  Created by Fedor Penin on 23.03.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		self.window = UIWindow(frame: UIScreen.main.bounds)

		// Объект MainViewController встраиваем в NavigationController,
		// который понадобиться во второй части.
		let navC: UINavigationController = UINavigationController(rootViewController: StocksViewController())
		self.window?.rootViewController = navC

		self.window?.backgroundColor = UIColor.white
		self.window?.makeKeyAndVisible()

		UINavigationBar.appearance().barTintColor = UIColor.init(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)
		
		application.statusBarStyle = .lightContent

		let controller1 = HomeAssembly.module()

		return true
	}
}
