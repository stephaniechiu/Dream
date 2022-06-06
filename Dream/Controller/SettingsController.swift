//
//  SettingsController.swift
//  Dream
//
//  Created by Stephanie on 9/21/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {
    let settingsView = SettingsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = settingsView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
