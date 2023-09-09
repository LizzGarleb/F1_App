//
//  ViewController.swift
//  F1_App
//
//  Created by Lizbeth Garcia on 9/5/23.
//

import SwiftUI
import URLImage

struct DriverListView: View {
    @StateObject var driverModel = DriverModel()
    @State private var isDriverDetailActive = false
    
    // Empty string for Search Bar
    @State private var searchText = ""
    
    // Empty variable type int for years dropdown
    @State private var selectedYear: Int? = nil
    
    
    var filteredDrivers: [Driver] {
        if searchText.isEmpty {
            return driverModel.drivers
        } else {
            return driverModel.drivers.filter { driver in
                driver.givenName.localizedCaseInsensitiveContains(searchText) || driver.familyName.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        // Arrays of years from 1950 until current...
        let currentYear = Calendar.current.component(.year, from: Date())
        let years: [Int] = (1950...currentYear).reversed().map { $0 }
        
        NavigationView {
            List {
                
                SearchBar(text: $searchText)
                    .listRowInsets(EdgeInsets())
                
                Picker("Select Year", selection: Binding(
                    get: { selectedYear ?? Calendar.current.component(.year, from: Date()) },
                    set: { selectedYear = $0 }
                )) {
                    ForEach(years, id: \.self) { year in
                        Text("\(year)")
                    }
                }

                ForEach(filteredDrivers, id: \.self) { driver in
                    HStack {

                        if let driverImageURL = driverTeamPairs.first(where: { $0.driverId == driver.driverId })?.driverImg,
                           let imageURL = URL(string: driverImageURL) {
                            URLImage(imageURL) { image in
                                image
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .clipShape(Circle())
                            }
                        } else {
                            Image(systemName: "car")
                                .frame(width: 60, height: 60)
                                .background(Color.gray)
                                .clipShape(Circle())
                        }

                        Spacer().frame(width: 20)
                        Text(driver.givenName + " " + driver.familyName)
                            .bold()
                        Text(driver.nationality)
                    }
                    .contentShape(Rectangle())
                    .padding(.vertical, 8)
                    .onTapGesture {
                        print(driver.driverId)
                        self.driverModel.fetchDriverData(for: driver.driverId)
                        self.isDriverDetailActive = true // Activate the navigation
                    }
                    .background(
                        NavigationLink("", destination: DriverDetailView(driverId: driver.driverId, driverData: $driverModel.driverData), isActive: $isDriverDetailActive)
                            .opacity(0)
                            .buttonStyle(PlainButtonStyle())
                    )
                }
            }
            .navigationTitle("Drivers")
            .onAppear {
                driverModel.fetchDriverYear(for: Calendar.current.component(.year, from: Date()))
                selectedYear = 2023
            }
            .onChange(of: selectedYear) { newYear in
                if let year = newYear {
                    driverModel.fetchDriverYear(for: year)
                } else {
                    driverModel.fetchDrivers()
                }
            }
        }
    }
}



struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $text, onCommit: {
                // Handle search action here, if needed
            })
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            
            if !text.isEmpty {
                Button(action: {
                    withAnimation {
                        text = ""
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
            }
        }
        .padding(.horizontal)
    }
}


struct DriverListView_Previews: PreviewProvider {
    static var previews: some View {
        DriverListView()
    }
}
