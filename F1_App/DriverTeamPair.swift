//
//  TeamList.swift
//  F1_App
//
//  Created by Lizbeth Garcia on 9/7/23.
//

import SwiftUI

struct DriverTeamPair: Identifiable {
    var id: String { driverId }
    let driverId: String
    let driverTeam: String
    let driverImg: String
}

let driverTeamPairs: [DriverTeamPair] = [
    
    DriverTeamPair(driverId: "de_vries", driverTeam: "alphaTauri", driverImg: "https://cdn-8.motorsport.com/images/mgl/2Qz5kRNY/s800/nyck-de-vries-alphatauri-1.jpg"),
    
    DriverTeamPair(driverId: "kevin_magnussen", driverTeam: "haas", driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/magnussen.jpg.img.1024.medium.jpg/1677069387823.jpg"),
    
    DriverTeamPair(driverId: "ricciardo", driverTeam: "alphaTauri", driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/ricciardo.jpg.img.1024.medium.jpg/1689928543988.jpg"),
    
    
    DriverTeamPair(driverId: "hamilton",
                   driverTeam: "mercedes",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/hamilton.jpg.img.1024.medium.jpg/1677069646195.jpg"),
    
    DriverTeamPair(driverId: "perez",
                   driverTeam: "rebBull",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/perez.jpg.img.1024.medium.jpg/1677069773437.jpg"),
    
    DriverTeamPair(driverId: "max_verstappen",
                   driverTeam: "redBull",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/verstappen.jpg.img.1024.medium.jpg/1677069646195.jpg"),
    
    DriverTeamPair(driverId: "russell",
                   driverTeam: "mercedes",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/russell.jpg.img.1024.medium.jpg/1677069334466.jpg"),
    
    DriverTeamPair(driverId: "leclerc",
                   driverTeam: "ferrari",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/leclerc.jpg.img.1024.medium.jpg/1677069223130.jpg"),
    
    DriverTeamPair(driverId: "sainz",
                   driverTeam: "ferrari",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/sainz.jpg.img.1024.medium.jpg/1677069189406.jpg"),
    
    DriverTeamPair(driverId: "stroll",
                   driverTeam: "astonMartin",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/stroll.jpg.img.1024.medium.jpg/1677069453013.jpg"),
    
    DriverTeamPair(driverId: "alonso",
                   driverTeam: "astonMartin",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/alonso.jpg.img.1024.medium.jpg/1677244577162.jpg"),
    
    DriverTeamPair(driverId: "piastri",
                   driverTeam: "mcLaren",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/piastri.jpg.img.1024.medium.jpg/1676983075734.jpg"),
    
    DriverTeamPair(driverId: "norris",
                   driverTeam: "mcLaren",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/norris.jpg.img.1024.medium.jpg/1677069505471.jpg"),
    
    DriverTeamPair(driverId: "gasly",
                   driverTeam: "alpine",
                   driverImg: "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/P/PIEGAS01_Pierre_Gasly/piegas01.png.transform/2col-retina/image.png"),
    
    DriverTeamPair(driverId: "ocon",
                   driverTeam: "alpine",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/ocon.jpg.img.1024.medium.jpg/1677069269007.jpg"),
    
    DriverTeamPair(driverId: "sargeant",
                   driverTeam: "williams",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/sargeant.jpg.img.1024.medium.jpg/1689255450602.jpg"),
    
    DriverTeamPair(driverId: "albon",
                   driverTeam: "williams",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/albon.jpg.img.1024.medium.jpg/1689253984120.jpg"),
    
    DriverTeamPair(driverId: "magnussen",
                   driverTeam: "haas",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/magnussen.jpg.img.1024.medium.jpg/1677069387823.jpg"),
    
    DriverTeamPair(driverId: "hulkenberg",
                   driverTeam: "haas",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/hulkenberg.jpg.img.1024.medium.jpg/1676983071882.jpg"),
    
    DriverTeamPair(driverId: "bottas",
                   driverTeam: "alfaRomeo",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/bottas.jpg.img.1024.medium.jpg/1677069810695.jpg"),
    
    DriverTeamPair(driverId: "zhou",
                   driverTeam: "alfaRomeo",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/zhou.jpg.img.1024.medium.jpg/1677069909295.jpg"),
    
    DriverTeamPair(driverId: "tsunoda",
                   driverTeam: "alphaTauri",
                   driverImg: "https://media.formula1.com/content/dam/fom-website/drivers/2023Drivers/tsunoda.jpg.img.1024.medium.jpg/1677069846213.jpg"),
    
    DriverTeamPair(driverId: "lawson",
                   driverTeam: "alphaTauri",
                   driverImg: "https://media.formula1.com/d_driver_fallback_image.png/content/dam/fom-website/drivers/L/LIALAW01_Liam_Lawson/lialaw01.png.transform/2col-retina/image.png"),
    
    
    DriverTeamPair(driverId: "berg", driverTeam: "osella", driverImg: "https://static.wikia.nocookie.net/f1wikia/images/6/6b/Allen-berg.jpg/revision/latest?cb=20150423020242"),
    
    DriverTeamPair(driverId: "acheson", driverTeam: "ford", driverImg: "https://article-imgs.scribdassets.com/5ab1hpn5s8kcvd2/images/fileFO2A4I7T.jpg"),
    
    DriverTeamPair(driverId: "adams", driverTeam: "lotus", driverImg: "https://www.f1forgottendrivers.com/wp-content/uploads/300-adams_philippe.jpg"),
    
    DriverTeamPair(driverId: "adolff", driverTeam: "ferrari_1953", driverImg: "https://www.f1forgottendrivers.com/wp-content/uploads/adolff.jpg"),
    
    DriverTeamPair(driverId: "abecassis", driverTeam: "astonMartin", driverImg: "https://static.wikia.nocookie.net/f1wikia/images/d/d2/Abecassis.jpg/revision/latest?cb=20171206194312")
]
