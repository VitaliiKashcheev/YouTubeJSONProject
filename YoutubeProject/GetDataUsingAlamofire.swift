//
//  GetDataUsingAlamofire.swift
//  YoutubeProject
//
//  Created by Виталий on 2/10/21.
//  Copyright © 2021 Виталий. All rights reserved.
//



//MARK: Get Data Using Alamofire


//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        let location = locations[0]
//        lat = location.coordinate.latitude
//        lon = location.coordinate.longitude
//        Alamofire.request("http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric").responseJSON {
//            response in
//            if let responseStr = response.result.value{
//                let jsonResponse = JSON(responseStr)
//                let jsonWeather = jsonResponse["weather"].array![0]
//                let jsonTemp = jsonResponse["main"]
//                let iconName = jsonWeather["icon"].stringValue
//
//                self.location.text = jsonResponse["name"].stringValue
//                self.temp.text = "\(Int(round(jsonTemp["temp"].doubleValue)))`C"
//                self.image.image = UIImage(named: iconName)
//
//                print(jsonResponse)
//
//            }
//        }
//    }
