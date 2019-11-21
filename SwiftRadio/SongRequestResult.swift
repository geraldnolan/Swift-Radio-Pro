//
//  Result.swift
//  SwiftRadio
//
//  Created by Care Value on 8/24/19.
//  Copyright © 2019 matthewfecher.com. All rights reserved.
//

import Foundation

// MARK: - Result
struct SongRequestResult: Codable {
    let success: Bool?
    let message, formattedMessage: String?
    
    init(success: Bool?, message: String?, formattedMessage: String?) {
        self.success = success
        self.message = message
        self.formattedMessage = formattedMessage
    }
}
