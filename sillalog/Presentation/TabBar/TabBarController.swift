import UIKit
import RxSwift
import RxCocoa

class CustomTabBar: UITabBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var sizeThatFits = super.sizeThatFits(size)
        sizeThatFits.height = 100
        return sizeThatFits
    }
}

class TabBarController: UITabBarController {
    
    private let disposeBag = DisposeBag()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setValue(CustomTabBar(), forKey: "tabBar")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setValue(CustomTabBar(), forKey: "tabBar")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        styleTabBar()
        bindTabBar()
    }
    
    private func setupTabs() {
        let homeVC = HomeViewController()
        let mapVC = MapViewController()
        let dexVC = StampViewController()
        let QizeVC = QuizViewController()
        let moreVC = MyPageViewController()
        
        homeVC.tabBarItem = UITabBarItem(title: "홈",
                                         image: UIImage(systemName: "house"),
                                         selectedImage: UIImage(systemName: "house.fill"))
        
        mapVC.tabBarItem = UITabBarItem(title: "지도",
                                        image: UIImage(systemName: "map"),
                                        selectedImage: UIImage(systemName: "map.fill"))
        
        dexVC.tabBarItem = UITabBarItem(title: "도감",
                                        image: UIImage(systemName: "book"),
                                        selectedImage: UIImage(systemName: "book.fill"))
        
        QizeVC.tabBarItem = UITabBarItem(title: "퀴즈",
                                            image: UIImage(systemName: "flag"),
                                            selectedImage: UIImage(systemName: "flag.fill"))
        
        moreVC.tabBarItem = UITabBarItem(title: "더보기",
                                         image: UIImage(systemName: "ellipsis"),
                                         selectedImage: UIImage(systemName: "ellipsis.circle.fill"))
        
        viewControllers = [
            UINavigationController(rootViewController: homeVC),
            UINavigationController(rootViewController: mapVC),
            UINavigationController(rootViewController: dexVC),
            UINavigationController(rootViewController: QizeVC),
            UINavigationController(rootViewController: moreVC)
        ]
    }
    
    private func styleTabBar() {
        tabBar.backgroundColor = UIColor(red: 0.97, green: 0.96, blue: 0.92, alpha: 1.0)
        tabBar.isTranslucent = false
        
        // 탭바 상단에 아주 연한 경계선 처리
        tabBar.shadowImage = UIImage()
        tabBar.layer.borderWidth = 0.5
        tabBar.layer.borderColor = UIColor.black.withAlphaComponent(0.05).cgColor
        
        // 아이템 색상 세팅
        tabBar.tintColor = UIColor(red: 0.25, green: 0.18, blue: 0.06, alpha: 1.0)
        tabBar.unselectedItemTintColor = .gray // 선택 안 됐을 때 회색
        
        if let items = tabBar.items {
            for item in items {
                item.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: 6)
            }
        }
        
    }
    
    private func bindTabBar() {
        // 안전하게 뷰컨트롤러 전환 상태만 감지 (필요 시 특정 로그를 찍거나 이벤트를 보낼 때 활용)
        self.rx.didSelect
            .subscribe(onNext: { selectedVC in
                // 애니메이션이 없으므로 단순 클릭 처리용 피드백이 필요하다면 여기에 작성합니다.
                // 현재는 UIKit 기본 기능인 selectedImage가 색 채우기를 자동으로 처리해 줍니다.
            })
            .disposed(by: disposeBag)
    }
    class CustomTabBar: UITabBar {
        override func sizeThatFits(_ size: CGSize) -> CGSize {
            var sizeThatFits = super.sizeThatFits(size)
            sizeThatFits.height = 100
            return sizeThatFits
        }
    }
}
