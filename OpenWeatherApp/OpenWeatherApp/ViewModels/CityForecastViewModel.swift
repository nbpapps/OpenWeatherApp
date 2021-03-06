//
//  CityForecastViewModel.swift
//  OpenWeatherApp
//
//  Created by niv ben-porath on 08/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//

import UIKit

/*
 VM for showing city forecast
 
 */

struct CityForecastForDay {
    var day : String
    var temp : String
}


final class CityForecastViewModel : NSObject {
    
    private var cityForcast : CityForecast
    private lazy var cityForcastArray = createCityForecastForDatesArray()

    
    init(cityForcast : CityForecast) {
        self.cityForcast = cityForcast
        super.init()
    }
    
    func cityName() -> String {
        return cityForcast.cityName ?? ""
    }
    
    func cityCurrentWeather() -> String {
        var cityTemp = "--" + Values.degreeSign
        if let currentTemp = cityForcast.currectDateTemp {
            cityTemp = String(Int(truncating: currentTemp)) + Values.degreeSign
        }
        return cityTemp
    }
    
    func shownForecast(at index : Int) -> CityForecastForDay {
        guard index < cityForcastArray.count else {
            preconditionFailure(Texts.noItemInRow)
        }
        
        return cityForcastArray[index]
    }

    func createCityForecastForDatesArray() -> [CityForecastForDay] {
        var cityForecastForDayArray = [CityForecastForDay]()
        /////////////  this should have been added to the Date+utils ///////////////////

        let daysOfTheWeek = ["Sunday","Monday","Tuesday","Wedensday","Thursday","Friday","Saturday"]
        
        //find the current day of the week for the city forecast
        //go over the next 5 days
        //find the next day index
        //find the next day string (is a %7 index in the array of days)
        //save the matching next day temp with the day name
        
        if let currentDayInt = cityForcast.currentDate?.dayOfTheWeekInt {
            let currentDayIndex = currentDayInt - 1 //weekdays start at 1, but the index starts at zero
            
            for nextDay in 1...5 {
                let nextDayIndex = currentDayIndex + nextDay
                let nextDayString = daysOfTheWeek[nextDayIndex % 7]
                var nextDayTemp : NSNumber?
                switch nextDay {
                case 1:
                    nextDayTemp = cityForcast.firstDateTemp
                case 2:
                    nextDayTemp = cityForcast.secondDateTemp
                case 3:
                    nextDayTemp = cityForcast.thirdDateTemp
                case 4:
                    nextDayTemp = cityForcast.fourthDateTemp
                case 5:
                    nextDayTemp = cityForcast.fifthDayeTemp
                default:
                    break
                }
                
                var tempString = "--" + Values.degreeSign
                if let tempInt = nextDayTemp?.intValue {
                    tempString = String(tempInt) + Values.degreeSign
                }
                
                let cityForecastForDay = CityForecastForDay(day: nextDayString, temp: tempString)
                cityForecastForDayArray.append(cityForecastForDay)
            }
        }else{
            //If we don't have a day of the week, we can show the date with day/month. This was not implemented due to time constraints            
        }
        return cityForecastForDayArray
    }
}

//we add the data source to this VM
extension CityForecastViewModel : UITableViewDataSource {
    //MARK: - table view data source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityForcastArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.reuseId) as? ForecastTableViewCell else {
            preconditionFailure(Texts.incorrectCell)
        }
        
        let cityForecastDay = shownForecast(at: indexPath.row)
            
        
        cell.dayLabel.text = cityForecastDay.day
        cell.tempLabel.text = cityForecastDay.temp
        
        return cell
    }
}
