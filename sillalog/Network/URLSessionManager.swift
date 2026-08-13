import Foundation
import RxSwift

final class URLSessionManager {

    static let shared = URLSessionManager()

    private init() { }

    func fetchTourList() -> Single<Data> {

        guard var components = URLComponents(
            string: EndPoint.baseURL + EndPoint.areaBasedList
        ) else {
            return .error(APIError.invalidURL)
        }

        components.queryItems = [
            URLQueryItem(
                name: "serviceKey",
                value: APIKey.openAPI
            ),
            URLQueryItem(
                name: "MobileOS",
                value: "IOS"
            ),
            URLQueryItem(
                name: "MobileApp",
                value: "ShillaLog"
            ),
            URLQueryItem(
                name: "_type",
                value: "json"
            ),
            URLQueryItem(
                name: "areaCode",
                value: "35"
            ),
            URLQueryItem(
                name: "contentTypeId",
                value: "12"
            ),
            URLQueryItem(
                name: "numOfRows",
                value: "100"
            ),
            URLQueryItem(
                name: "pageNo",
                value: "1"
            )
        ]

        guard let url = components.url else {
            return .error(APIError.invalidURL)
        }

        print("📡 URL:", url.absoluteString)

        return Single.create { single in

            let task = URLSession.shared.dataTask(with: url) {
                data,
                response,
                error in

                if let error {
                    single(.failure(error))
                    return
                }

                guard let response = response as? HTTPURLResponse else {
                    single(.failure(APIError.invalidResponse))
                    return
                }

                print("📡 Status Code:", response.statusCode)

                guard (200...299).contains(response.statusCode) else {

                    if let data {
                        print("❌ Server Response:")
                        print(String(data: data, encoding: .utf8) ?? "")
                    }

                    single(.failure(APIError.invalidResponse))
                    return
                }

                guard let data else {
                    single(.failure(APIError.requestFailed))
                    return
                }

                single(.success(data))
            }

            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
