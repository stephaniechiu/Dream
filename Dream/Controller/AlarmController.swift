//
//  AlarmController.swift
//  Dream
//
//  Created by Stephanie Chiu on 9/21/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit

class AlarmController: UIViewController {

	// MARK: - Properties

	let alarmView = AlarmView()

	// MARK: - Lifestyle

	override func viewDidLoad() {
		super.viewDidLoad()
		view = alarmView
	}
}
