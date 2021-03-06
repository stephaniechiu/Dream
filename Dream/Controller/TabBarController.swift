//
//  TabBarController.swift
//  Dream
//
//  Created by Stephanie Chiu on 9/20/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

	// MARK: - Constants

	let journalViewController = JournalController()
	let searchController = SearchController()
	let alarmController = AlarmController()
	let settingsController = SettingsController()

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		self.delegate = self
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setupUI()
		setGradientBackground()
	}

	func setupUI() {
		tabBar.backgroundColor = UIColor.backgroundBlue
		UITabBar.appearance().tintColor = .white
		UITabBar.appearance().shadowImage = UIImage()
		UITabBar.appearance().backgroundImage = UIImage()

		let journalTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "journal"), tag: 1)
		journalViewController.tabBarItem = journalTabBarItem

		let searchTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "search"), tag: 2)
		searchController.tabBarItem = searchTabBarItem

		let alarmTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "alarm"), tag: 3)
		alarmController.tabBarItem = alarmTabBarItem

		let settingsTabBarItem = UITabBarItem(title: nil, image: UIImage(named: "settings"), tag: 4)
		settingsController.tabBarItem = settingsTabBarItem

		self.viewControllers = [journalViewController, searchController, alarmController, settingsController]
	}

	func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
			print("🦊")
	}

	func setGradientBackground() {
		let colorTop = UIColor.backgroundPink.cgColor
		let colorBottom = UIColor.backgroundBlue.cgColor

		let gradientLayer = CAGradientLayer()
		gradientLayer.colors = [colorTop, colorBottom]
		gradientLayer.locations = [0.0, 0.9]
		gradientLayer.frame = self.view.bounds

		self.view.layer.insertSublayer(gradientLayer, at: 0)
	}
}
