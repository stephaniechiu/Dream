//
//  JournalView.swift
//  Dream
//
//  Created by Stephanie Chiu on 9/17/21.
//  Copyright © 2021 Stephanie Chiu. All rights reserved.
//

import UIKit

class JournalView: UIView {

	// MARK: - Constants

	let headerContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	let mainHeaderLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Nunito", size: 40.0)
		label.font = label.font.withSize(40)
		label.textColor = UIColor.darkBlueTint
		label.text = "Good Morning 🐣"
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	let dateHeaderLabel: UILabel = {
		let label = UILabel()
		label.font = UIFont(name: "Nunito", size: 16.0)
		label.textColor = UIColor.darkBlueTint
		label.text = "Sunday, September 19, 2021"
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()

	let audioContainer: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	let audioButton: UIButton = {
		let button = UIButton()
		button.backgroundColor = UIColor.buttonBackground
		button.layer.borderColor = UIColor.buttonBackground.cgColor
		button.layer.cornerRadius = 24
		button.layer.borderWidth = 0.8
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()

	let audioImage: UIImageView = {
		let image = UIImageView(image: UIImage(named: "microphone"))
		image.alpha = 1.0
		image.translatesAutoresizingMaskIntoConstraints = false
		return image
	}()

	let tableView: UITableView = {
		let tableView = UITableView()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.tableFooterView = UIView()
		return tableView
	}()

	// MARK: - Init
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupSubviews()
		setBlurEffect()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupSubviews() {
		addSubviews()
		NSLayoutConstraint.activate(
			[
				// Header
				headerContainer.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
				headerContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
				headerContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 20),
				headerContainer.heightAnchor.constraint(equalToConstant: 300),

				mainHeaderLabel.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor),
				mainHeaderLabel.topAnchor.constraint(equalTo: headerContainer.topAnchor),

				dateHeaderLabel.leadingAnchor.constraint(equalTo: headerContainer.leadingAnchor),
				dateHeaderLabel.topAnchor.constraint(equalTo: mainHeaderLabel.bottomAnchor, constant: 8),

				// Floating audio button
				audioContainer.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
				audioContainer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16),
				audioContainer.widthAnchor.constraint(equalToConstant: 48),
				audioContainer.heightAnchor.constraint(equalToConstant: 48),

				audioButton.centerYAnchor.constraint(equalTo: audioContainer.centerYAnchor),
				audioButton.centerXAnchor.constraint(equalTo: audioContainer.centerXAnchor),
				audioButton.widthAnchor.constraint(equalToConstant: 48),
				audioButton.heightAnchor.constraint(equalToConstant: 48),

				audioImage.centerYAnchor.constraint(equalTo: audioContainer.centerYAnchor),
				audioImage.centerXAnchor.constraint(equalTo: audioContainer.centerXAnchor),

				// Table View
				tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
				tableView.topAnchor.constraint(equalTo: topAnchor),
				tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
				tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
			]
		)
	}

	func addSubviews() {
		addSubview(headerContainer)
		headerContainer.addSubview(mainHeaderLabel)
		headerContainer.addSubview(dateHeaderLabel)

		addSubview(audioContainer)
		audioContainer.addSubview(audioButton)
		audioButton.addSubview(audioImage)

		addSubview(tableView)
	}

	func setBlurEffect() {
		let blurView = UIVisualEffectView()
		blurView.frame = audioButton.frame
		blurView.effect = UIBlurEffect(style: .regular)
		audioButton.addSubview(blurView)
	}
}
