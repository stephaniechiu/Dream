//
//  DreamLog.swift
//  Dream
//
//  Created by Stephanie Chiu on 11/25/22.
//  Copyright © 2022 Stephanie Chiu. All rights reserved.
//

import Foundation

struct DreamLog: Identifiable, Codable {
    let id: UUID
    let date: Date
    var transcript: String?

    init(id: UUID = UUID(), date: Date = Date(), transcript: String? = nil) {
        self.id = id
        self.date = date
        self.transcript = transcript
    }
}
