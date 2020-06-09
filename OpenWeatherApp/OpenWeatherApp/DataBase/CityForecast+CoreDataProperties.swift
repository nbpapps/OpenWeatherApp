//
//  CityForecast+CoreDataProperties.swift
//  OpenWeatherApp
//
//  Created by niv ben-porath on 09/03/2020.
//  Copyright © 2020 nbpApps. All rights reserved.
//
//

import Foundation
import CoreData
/*
 Object for keeping the forecast for a city.
 
 */

extension CityForecast {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<CityForecast> {
        return NSFetchRequest<CityForecast>(entityName: "CityForecast")
    }

    @NSManaged public var cityId: NSNumber?
    @NSManaged public var cityName: String?
    @NSManaged public var currectDateTemp: NSNumber?
    
//    !!! this should have been broken down into an array

    @NSManaged public var firstDateTemp: NSNumber?
    @NSManaged public var secondDateTemp: NSNumber?
    @NSManaged public var thirdDateTemp: NSNumber?
    @NSManaged public var fourthDateTemp: NSNumber?
    @NSManaged public var fifthDayeTemp: NSNumber?
    @NSManaged public var currentDate: Date?

}
