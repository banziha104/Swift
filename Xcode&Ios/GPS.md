# GPS 사용방법

- 인증 요청하기 및 delegate 패턴 추가

```swift
// ViewController
override func viewDidLoad() {
        super.viewDidLoad()
        locationManger.delegate = self
        locationManger.requestWhenInUseAuthorization()
    }
    
// extension

extension ViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways :
            updateLocation()
        default:
            print("unavailable")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 가장 마지막값을 받아옮
        if let current = locations.last{
            print(current.coordinate.latitude , current.coordinate.longitude)
        }
    }
    func updateLocation() {
        locationManger.startUpdatingLocation()
    }
    
}
```

- Info.plist 에서 권한 추가
    - 오른쪽 마우스, add Row
    - Privacy - Location When In Use Usage Description 
    - 허용할 값 추가
    
    
### GeoCoding

- GeoCoding


## 전체코드
    
```swift
//
//  ViewController.swift
//  Weather
//
//  Created by 이영준 on 2018. 2. 28..
//  Copyright © 2018년 이영준. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    
    let locationManger = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManger.delegate = self
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .notDetermined:
            locationManger.requestWhenInUseAuthorization()
        default:
            print("기타 등등")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse :
            updateLocation()
        default:
            print("unavailable")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // 가장 마지막값을 받아옮
        if let current = locations.last{
            print(current.coordinate.latitude , current.coordinate.longitude)
        }
    }
    func updateLocation() {
        locationManger.startUpdatingLocation()
    }
    
}

```