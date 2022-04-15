//
//  AlarmView.swift
//  Dream
//
//  Created by Stephanie Chiu on 9/19/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit

class AlarmView: UIView {

	// MARK: - Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		backgroundColor = .systemBlue
		translatesAutoresizingMaskIntoConstraints = false
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
