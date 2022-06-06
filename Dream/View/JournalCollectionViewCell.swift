//
//  JournalCollectionViewCell.swift
//  Dream
//
//  Created by Sunshine on 4/7/22.
//  Copyright © 2022 Stephanie Chiu. All rights reserved.
//

import UIKit

class JournalCollectionViewCell: UICollectionViewCell {

    // MARK: - Properties

    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let dateStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let dayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito", size: 28.0)
        label.font = label.font.withSize(28)
        label.textColor = UIColor.darkBlueTint
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "15"
        return label
    }()

    let monthLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito", size: 18.0)
        label.font = label.font.withSize(18)
        label.textColor = UIColor.darkBlueTint
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "JUN"
        return label
    }()

    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito", size: 10.0)
        label.font = label.font.withSize(10)
        label.textColor = UIColor.darkBlueTint
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12:31pm"
        return label
    }()

    let previewLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Nunito", size: 12.0)
        label.font = label.font.withSize(12)
        label.textColor = UIColor.darkBlueTint
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "I was on a trip in Thailand when an elephant attacked. I remember someone waving their hands while running towards a stormy field..."
        return label
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupUI() {
        backgroundColor = .white
        
        layer.cornerRadius = 20.0
        layer.masksToBounds = false
        layer.mask?.opacity = 0.7

        addSubview(containerView)
        containerView.addSubview(dateStackView)
        containerView.addSubview(previewLabel)
        dateStackView.addArrangedSubview(dayLabel)
        dateStackView.addArrangedSubview(monthLabel)
        dateStackView.addArrangedSubview(timeLabel)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),

            dateStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            dateStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            dateStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),

            previewLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            previewLabel.leadingAnchor.constraint(equalTo: dateStackView.trailingAnchor, constant: 8),
            previewLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            previewLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
        ])
    }
}
