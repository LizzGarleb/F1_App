//
//  DriverProfileModel.swift
//  F1_App
//
//  Created by Lizbeth Garcia on 9/6/23.
//

import SwiftUI
import URLImage


struct DriverDetailView: View {
    let driverId: String
    @Binding var driverData: DriverDetailResponse?
    @EnvironmentObject var driverModel: DriverModel
    @State private var image: UIImage? = nil

    var body: some View {
        if let driverData = driverData, let driver = driverData.MRData.driverTable.drivers.first {
            
            ZStack(alignment: .top) {
                
                // Banner Image = Team Car
                Image(uiImage: image ?? {
                    if let imageName = driverTeamPairs.first(where: { $0.driverId == driver.driverId })?.driverTeam {
                        return UIImage(named: imageName)!
                    } else {
                        return UIImage(named: "car")!
                    }
                }())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
                
                // Profile Image = Driver
                if let driverImageURL = driverTeamPairs.first(where: { $0.driverId == driver.driverId })?.driverImg, let imageURL = URL(string: driverImageURL) {
                    URLImage(imageURL) { image in
                        image
                            .resizable()
                            .frame(width: 120, height: 120)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color(.systemBackground), lineWidth: 4))
                            .offset(x: 0, y: 100)
                    }
                }
                
                // User Information
                VStack(spacing: 5) {
                    Spacer()
                    Text(driver.givenName + " " + driver.familyName)
                        .font(.title)
                        .bold()
                    Text("Nationality: " + driver.nationality)
                        .font(.subheadline)
                    Text("Born: " + driver.dateOfBirth)
                        .font(.subheadline)
                }
                .offset(y: -350)
                .padding()
            }
            .offset(y: -100)
            .navigationBarHidden(false)
        } else {
            Text("Loading...")
        }
    }
}

