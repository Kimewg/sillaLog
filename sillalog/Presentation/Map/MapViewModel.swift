import Foundation
import RxSwift

final class MapViewModel {

    private let disposeBag = DisposeBag()

    func fetchTourList() {

        TourAPIService.shared.fetchTourList()
            .subscribe(
                onSuccess: { response in

                    let spots = response.response.body.items.item

                    print("✅ 관광지 개수:", spots.count)

                    spots.forEach { spot in
                        print("📍 관광지:", spot.title)
                        print("위도:", spot.latitude ?? "")
                        print("경도:", spot.longitude ?? "")
                    }
                },
                onFailure: { error in
                    print("❌ 관광 API 호출 실패:", error)
                }
            )
            .disposed(by: disposeBag)
    }
}
