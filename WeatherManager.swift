//
//  WeatherManager.swift
//  Clima
//
//  Created by Hao Tang on 4/4/21.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=217a15b3bb2f4120e5023e33ef82dd1e&units=metric"
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        // 1. create url
        if let url = URL(string: urlString) {
            // 2. create a session
            let session = URLSession(configuration: .default)
            // 3. give session a task
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            // 4. start the task
            task.resume()
        }
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error? ) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString ?? "None")
        }
    }
    
}
