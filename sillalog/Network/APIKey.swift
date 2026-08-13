//
//  APIKey.swift
//  sillalog
//
//  Created by 김은서 on 8/13/26.
//

import Foundation

enum APIKey {
    static let openAPI =
        Bundle.main.object(forInfoDictionaryKey: "OPEN_API_KEY") as? String ?? ""
}
