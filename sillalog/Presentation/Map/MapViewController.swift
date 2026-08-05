//
//  MapViewController.swift
//  sillalog
//
//  Created by 김은서 on 6/11/26.
//
import UIKit
import CoreLocation
import SnapKit
import RxSwift
import NMapsMap

class MapViewController: UIViewController{
    
    private let mapView = NMFMapView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    private func configureUI(){
        view.addSubview(mapView)
        
        mapView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
    }
}
