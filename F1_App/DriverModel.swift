//
//  DriverModel.swift
//  F1_App
//
//  Created by Lizbeth Garcia on 9/5/23.
//

import SwiftUI

struct DriverResponse: Codable {
    let MRData: MRData
}

struct MRData: Codable {
    let driverTable: DriverTable

    enum CodingKeys: String, CodingKey {
        case driverTable = "DriverTable"
    }
}

struct DriverTable: Codable {
    let drivers: [Driver]

    enum CodingKeys: String, CodingKey {
        case drivers = "Drivers"
    }
}

struct Driver: Hashable, Codable {
    let givenName : String
    let familyName: String
    let nationality: String
    let dateOfBirth: String
    let driverId: String
    
    enum CodingKeys: String, CodingKey {
        case givenName
        case familyName
        case nationality
        case dateOfBirth
        case driverId
    }
}

struct DriverDetailResponse: Codable {
    let MRData: MRData

    enum CodingKeys: String, CodingKey {
        case MRData = "MRData"
    }
}

class DriverModel: ObservableObject {
    
    @Published var drivers: [Driver] = []
    @Published var driverData: DriverDetailResponse?
    
    func fetchDrivers() {
        guard let url = URL(string: "https://ergast.com/api/f1/drivers.json?limit=1000")
            else {
                print("Invalid URL")
                return
            }
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let drivers = try JSONDecoder().decode(DriverResponse.self, from: data)
                    DispatchQueue.main.async {
                        self?.drivers = drivers.MRData.driverTable.drivers
                    }
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
        
    func fetchDriverData(for driverId: String) {
        guard let url = URL(string: "https://ergast.com/api/f1/drivers/\(driverId).json")
        else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let driverData = try JSONDecoder().decode(DriverDetailResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.driverData = driverData
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func fetchDriverYear(for year: Int) {
        guard let url = URL(string: "https://ergast.com/api/f1/\(year)/drivers.json") else {
            print("Invalid URL")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let drivers = try JSONDecoder().decode(DriverResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.drivers = drivers.MRData.driverTable.drivers
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
