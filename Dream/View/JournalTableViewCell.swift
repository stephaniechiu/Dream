//
//  JournalTableViewCell.swift
//  Dream
//
//  Created by Sunshine on 4/7/22.
//  Copyright © 2022 Stephanie Chiu. All rights reserved.
//

import UIKit

class JournalTableViewCell: UITableViewCell {
    static let identifier = "JournalCell"

    let mainHeaderLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        setupUI()
    }

    func setupUI() {
        
    }
}
