//
//  SwiftRadio-Settings.swift
//  Swift Radio
//
//  Created by Matthew Fecher on 7/2/15.
//  Copyright (c) 2015 MatthewFecher.com. All rights reserved.
//

import Foundation
import UIKit

//**************************************
// GENERAL SETTINGS
//**************************************

// Display Comments
let kDebugLog = true

// AirPlayButton Color
let globalTintColor = UIColor(red: 0, green: 189/255, blue: 233/255, alpha: 1);

//**************************************
// STATION JSON
//**************************************

// If this is set to "true", it will use the JSON file in the app
// Set it to "false" to use the JSON file at the stationDataURL

let useLocalStations = false


//**************************************
// Station API
//**************************************

let stationDataURL   = "https://api.noltech.co/api/music/stations/86"
let stationAPI = "http://icecast.noltech.co/api/"
let stationAPIXKey = "1219751622122bd3:2350fbd6db11edfa37d7d63938189140"
var stationsRequestAPI = "http://icecast.bobbaay.com/api/station/1/requests?rowCount=-1"

//**************************************
// App Center
//**************************************

let appCenterID = "04be9331-03f4-41dc-a327-820fbc330e70"

//**************************************
// SEARCH BAR
//**************************************

// Set this to "true" to enable the search bar
let searchable = true

//**************************************
// NEXT / PREVIOUS BUTTONS
//**************************************

// Set this to "false" to show the next/previous player buttons
let hideNextPreviousButtons = false

//**************************************
// AirPlay BUTTON
//**************************************

// Set this to "true" to hide the AirPlay button
let hideAirPlayButton = false
