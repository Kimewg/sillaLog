//
//  TourAPIService.swift
//  sillalog
//
//  Created by 김은서 on 6/11/26.
//

import Foundation
import RxSwift

final class TourAPIService {

    static let shared = TourAPIService()

    private init() { }

    func fetchTourList() -> Single<TourAPIResponse> {

        URLSessionManager.shared.fetchTourList()
            .map { data in

                do {
                    return try JSONDecoder().decode(
                        TourAPIResponse.self,
                        from: data
                    )
                } catch {
                    print("❌ Decoding Error:", error)
                    throw APIError.decodingError
                }
            }
    }
}
