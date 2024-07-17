//
//  DataManager.swift
//  WeatherAnimation
//
//  Created by Danil Antonov on 16.07.2024.
//

import Foundation

class DataManager {
    func getWeathersData() -> [WeatherItem] {
        return [
            WeatherItem(weatherType: String(localized: "string_weather_sun"), weatherIconColor: "#fbf700", weatherImageName: "sun.max", weatherBackgroundImageName: "ImageSun"),
            WeatherItem(weatherType: String(localized: "string_weather_rain"), weatherIconColor: "#4982c5", weatherImageName: "cloud.rain", weatherBackgroundImageName: "ImageRain"),
            WeatherItem(weatherType: String(localized: "string_weather_heavyrain"), weatherIconColor: "#365d8a", weatherImageName: "cloud.heavyrain", weatherBackgroundImageName: "ImageHeavyRain"),
            WeatherItem(weatherType: String(localized: "string_weather_snow"), weatherIconColor: "#d7f2ff", weatherImageName: "cloud.snow", weatherBackgroundImageName: "ImageSnow"),
            WeatherItem(weatherType: String(localized: "string_weather_bolt"), weatherIconColor: "#00405f", weatherImageName: "cloud.bolt", weatherBackgroundImageName: "ImageLightning"),
            WeatherItem(weatherType: String(localized: "string_weather_storm"), weatherIconColor: "#00537a", weatherImageName: "cloud.bolt.rain", weatherBackgroundImageName: "ImageStorm"),
            WeatherItem(weatherType: String(localized: "string_weather_smoke"), weatherIconColor: "#d7f2ff", weatherImageName: "smoke", weatherBackgroundImageName: "ImageCloud"),
            WeatherItem(weatherType: String(localized: "string_weather_wind"), weatherIconColor: "#4982c5", weatherImageName: "wind.snow", weatherBackgroundImageName: "ImageBlizz"),
            WeatherItem(weatherType: String(localized: "string_weather_tornado"), weatherIconColor: "#000001", weatherImageName: "tornado", weatherBackgroundImageName: "ImageTornado"),
        ]
    }
}
