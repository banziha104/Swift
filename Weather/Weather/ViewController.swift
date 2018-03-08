//
//  ViewController.swift
//  Weather
//
//  Created by Keun young Kim on 2018. 2. 28..
//  Copyright © 2018년 Keun young Kim. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

struct Summary {
    let skyCode: String
    let skyName: String
    let minTemp: Double
    let maxTemp: Double
    let currentTemp: Double

    init?(json: JSON) {
        guard let code = json["weather"]["minutely"][0]["sky"]["code"].string else {
            fatalError("parsing error")
        }
        skyCode = code

        guard let name = json["weather"]["minutely"][0]["sky"]["name"].string else {
            fatalError("parsing error")
        }

        skyName = name

        guard let tcStr = json["weather"]["minutely"][0]["temperature"]["tc"].string, let tc = Double(tcStr) else {
            fatalError("parsing error")
        }
        currentTemp = tc

        guard let tmStr = json["weather"]["minutely"][0]["temperature"]["tmax"].string, let tm = Double(tmStr) else {
            fatalError("parsing error")
        }
        maxTemp = tm

        guard let minStr = json["weather"]["minutely"][0]["temperature"]["tmin"].string, let min = Double(minStr) else {
            fatalError("parsing error")
        }

        minTemp = min

    }
}


struct Forecast {
    let skyCode: String
    let skyName: String
    let temp: Double
    let date: Date
}

class ViewController: UIViewController {

    @IBOutlet weak var titleLable: UILabel!

    @IBOutlet weak var listTableView: UITableView!

    @IBOutlet weak var loader: UIActivityIndicatorView!
    let apiGroup = DispatchGroup()

    var summary: Summary?
    var forecastList = [Forecast]()

    let formatter = DateFormatter()


    lazy var manager: CLLocationManager = {
        let m = CLLocationManager()
        m.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        m.delegate = self

        return m
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loader.startAnimating()
        listTableView.alpha = 0.0
        titleLable.alpha = 0.0
        listTableView.rowHeight = UITableViewAutomaticDimension
        listTableView.estimatedRowHeight = 100

        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse:
            updateLocation()
        default:
            print("오류 처리")
        }
    }

    var topMargin: CGFloat = 0.0

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if topMargin < 1.0 {
            let first = IndexPath(row: 0, section: 0)
            if let cell = listTableView.cellForRow(at: first) {
                topMargin = cell.frame.height

                listTableView.contentInset = UIEdgeInsets(top: (listTableView.frame.height - topMargin), left: 0, bottom: 0, right: 0)
            }
        }
    }

    func fetchForecast(with coordinate: CLLocationCoordinate2D) {
        let urlStr = "https://api2.sktelecom.com/weather/forecast/3days?version=1&lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appKey=89483128-4501-4857-b684-76713e712695"
        guard let url = URL(string: urlStr) else {
            fatalError("invalid url")
        }

        apiGroup.enter()

        self.forecastList.removeAll()

        Alamofire.request(url).responseJSON { [weak self] (response) in
            guard let strongSelf = self else {
                if response.result.isSuccess {
                    if let dict = response.result.value as? [String: Any] {
                        let json = JSON(dict)
                        
                        
                        if let forcastDict = json["weather"]["forecast3days"][0]["fcst3hour"].dictionary {
                            var hour = 4
                            var date = Date()
                            
                            while hour < 67 {
                                defer {
                                    hour += 3
                                }
                                
                                guard let skyCode = forcastDict["sky"]?["code\(hour)hour"].string else {
                                    continue
                                }
                                
                                guard let skyName = forcastDict["sky"]?["name\(hour)hour"].string else {
                                    continue
                                }
                                
                                date = date.addingTimeInterval(3600 * 3)
                                
                                guard let tempStr = forcastDict["temperature"]?["temp\(hour)hour"].string else {
                                    continue
                                }
                                
                                let temp = Double(tempStr) ?? 0.0
                                
                                let data = Forecast(skyCode: skyCode, skyName: skyName, temp: temp, date: date)
                                self.forecastList.append(data)
                                
                                
                            }
                        }
                        
                        
                    }
                } else {
                    fatalError("fail")
                }
                
                self.apiGroup.leave()
            }
            }
            
    }


    func fetchSummary(with coordinate: CLLocationCoordinate2D) {
        let urlStr = "https://api2.sktelecom.com/weather/current/minutely?version=1&lat=\(coordinate.latitude)&lon=\(coordinate.longitude)&appKey=89483128-4501-4857-b684-76713e712695"
        guard let url = URL(string: urlStr) else {
            fatalError("invalid url")
        }

        apiGroup.enter()

        Alamofire.request(url).responseJSON { (response) in
            if response.result.isSuccess {
                if let dict = response.result.value as? [String: Any] {
                    let json = JSON(dict)
                    if let summary = Summary(json: json) {
                        self.summary = summary
                        print("======1")
                        self.listTableView.reloadData()
                    } else {
                        fatalError("fail")
                    }
                }
            } else {
                fatalError("fail")
            }
            self.apiGroup.leave()
        }


    }
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 0
        }

        return forecastList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SummaryTableViewCell") as! SummaryTableViewCell

            if let data = summary {
                cell.weatherImageView.image = UIImage(named: data.skyCode)
                cell.skyNameLabel.text = data.skyName
                cell.minMaxLabel.text = "최소 \(data.minTemp)℃  최대 \(data.maxTemp)℃"
                cell.tempLabel.text = "\(data.currentTemp)℃"
            }


            return cell
        } else if indexPath.section == 1 {
            return tableView.dequeueReusableCell(withIdentifier: "dummy")!
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastTableViewCell") as! ForecastTableViewCell


        let target = forecastList[indexPath.row]
        cell.skyImageView.image = UIImage(named: target.skyCode)
        cell.skyNameLabel.text = target.skyName
        cell.tempLabel.text = "\(target.temp)"

        formatter.dateFormat = "M.d (E)"
        cell.dateLabel.text = formatter.string(for: target.date)

        formatter.dateFormat = "HH:00"
        cell.timeLabel.text = formatter.string(for: target.date)

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
}


extension ViewController: CLLocationManagerDelegate {
    func updateLocation() {
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let current = locations.last {
            self.fetchSummary(with: current.coordinate)
            self.fetchForecast(with: current.coordinate)

            apiGroup.notify(queue: DispatchQueue.main, execute: {
                
                self.listTableView.reloadData()
                let first = IndexPath(row : 0 , section : 0)
                self.listTableView.scrollToRow(at: first, at: .top, animated: false)
                UIView.animate(withDuration: 0.3, animations: {
                    self.loader.alpha = 0.0
                    self.titleLable.alpha = 1.0
                    self.listTableView.alpha = 1.0
                }, completion: { (finished) in
                    self.loader.stopAnimating()
                })
            })
            let geoCoder = CLGeocoder()
            geoCoder.reverseGeocodeLocation(current, completionHandler: { (list, error) in
                if let error = error {
                    print("오류 처리")
                } else {
                    if let first = list?.first {
                        if let gu = first.locality, let dong = first.subLocality {
                            //print(gu, dong)
                            self.titleLable.text = "\(gu) \(dong)"
                        } else {
                            self.titleLable.text = first.name ?? "알 수 없음"
                        }
                    }
                }
            })
        }

        manager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            updateLocation()
        default:
            print("오류 처리")
        }
    }
}

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return indexPath
    }
}
