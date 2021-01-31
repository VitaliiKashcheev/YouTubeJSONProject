//
//  DataLoader.swift
//  YoutubeProject
//
//  Created by Виталий on 1/31/21.
//  Copyright © 2021 Виталий. All rights reserved.
//

import Foundation
import CoreLocation


extension ViewController {
    
     func loadData() {
        
        let urlString = "http://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=\(apiKey)&units=metric"

        guard let url = URL(string: urlString)  else {return}

        URLSession.shared.dataTask(with: url) {(data, _, err) in
            DispatchQueue.main.async {

                if let err = err {
                    print("Error", err)
                    return
                }

                guard let data = data else {return}

                do{
                    let events = try JSONDecoder().decode(JSONStruct.self, from: data)

                    self.location.text = events.name
                    self.temp.text = "\(Int(round(events.main.temp)))`C"
                    self.feelsLike.text = "Feels like \(Int(round(events.main.feels_like)))`C"
                    
                    let weatherArr = events.weather
                    
                    for weather in weatherArr{
                        self.status.text = weather.main
                    }

                } catch{
                    print(error)
                }
            }

            }.resume()

        print("Data Load")

    }

}
