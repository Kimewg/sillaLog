//
//  NetworkError.swift
//  sillalog
//
//  Created by 김은서 on 6/11/26.
//

enum APIError: Error {
    case invalidURL
    case requestFailed
    case invalidResponse
    case decodingError
}
