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

		let homeController = HomeAssembly.module()

//		let navC: UINavigationController = UINavigationController(rootViewController: StocksViewController())
		let navC: UINavigationController = UINavigationController(rootViewController: homeController)
		self.window?.rootViewController = navC
		self.window?.backgroundColor = UIColor.white
		self.window?.makeKeyAndVisible()

		UINavigationBar.appearance().barTintColor = UIColor.init(red: 230/255, green: 32/255, blue: 31/255, alpha: 1)

		application.statusBarStyle = .lightContent

		return true
	}
}
