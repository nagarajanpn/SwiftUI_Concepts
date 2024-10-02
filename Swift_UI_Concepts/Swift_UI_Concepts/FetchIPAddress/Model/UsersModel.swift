//
//  UsersModel.swift
//  Swift_UI_Concepts
//
//  Created by Nagarajan on 23/09/24.
//  Copyright © 2024 ORGNAGA. All rights reserved.
//

import Foundation

struct Users: Codable {
    let ip: String
    let city: String
    let region: String
    let country_name: String
    let latitude: Double
    let longitude: Double
    let network: String
}

// MARK: - Users
/*struct Users: Codable {
    let ip, network, version, city: String
    let region, regionCode, country, countryName: String
    let countryCode, countryCodeIso3, countryCapital, countryTLD: String
    let continentCode: String
    let inEu: Bool
    let postal: String
    let latitude, longitude: Double
    let timezone, utcOffset, countryCallingCode, currency: String
    let currencyName, languages: String
    let countryArea, countryPopulation: Int
    let asn, org: String

    enum CodingKeys: String, CodingKey {
        case ip, network, version, city, region
        case regionCode
        case country
        case countryName
        case countryCode
        case countryCodeIso3
        case countryCapital
        case countryTLD
        case continentCode
        case inEu
        case postal, latitude, longitude, timezone
        case utcOffset
        case countryCallingCode
        case currency
        case currencyName
        case languages
        case countryArea
        case countryPopulation
        case asn, org
    }
}*/
