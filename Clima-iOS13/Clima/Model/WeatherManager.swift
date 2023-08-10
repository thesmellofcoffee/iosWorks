//
//  WeatherManager.swift
//  Clima
//
//  Created by Orkun Enes on 12.04.2023.
//  Copyright © 2023 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=76f070efe3923bec308894ebb46e893a&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
        performRequest(with: urlString)
    }
    
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String){
        // 1) Create URL
        if let url = URL(string: urlString){
            // 2) Create a URLSession
            let session = URLSession(configuration: .default)
            // 3) Give the session a task
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print("31")
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    print("37")
                    if let weather = parseJSON(safeData){
                        self.delegate?.didUpdateWeather(self, weather: weather)
                    }
                }
            }
            // 4) Start the task
            print("42")
            task.resume()
        }
        
        
        func parseJSON(_ weatherData: Data)-> WeatherModel?{
            let decoder = JSONDecoder()
            
            do{
               let decodedData =  try decoder.decode(WeatherData.self, from: weatherData)
                
                let id = decodedData.weather[0].id
                let temp = decodedData.main.temp
                let name = decodedData.name
                
                let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
                
                return weather
             
            }catch{
                print("57")
                delegate?.didFailWithError(error: error)
                return nil
            }
        }
        
        
        
        
      
    }
    
}

