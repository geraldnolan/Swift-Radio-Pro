//
//  DataManager.swift
//  Swift Radio
//
//  Created by Matthew Fecher on 3/24/15.
//  Copyright (c) 2015 MatthewFecher.com. All rights reserved.
//

import UIKit

struct DataManager {
    
    //*****************************************************************
    // Helper struct to get either local or remote JSON
    //*****************************************************************
    
    static func getStationDataWithSuccess(success: @escaping ((_ metaData: Data?) -> Void)) {

        DispatchQueue.global(qos: .userInitiated).async {
            if useLocalStations {
                getDataFromFileWithSuccess() { data in
                   
                    success(data)
                }
            } else {
                guard let stationDataURL = URL(string: stationDataURL) else {
                    if kDebugLog { print("stationDataURL not a valid URL") }
                    success(nil)
                    return
                }
                
                loadDataFromURL(url: stationDataURL) { data, error in
                    let json = String(data: data!, encoding: String.Encoding.utf8)
                    print(json!)
                    success(data)
                }
            }
        }
    }
    
    static func getRequestDataWithSuccess(success: @escaping ((_ metaData: Data?) -> Void)) {
        
        DispatchQueue.global(qos: .userInitiated).async {
            
            guard let stationRequestAPI = URL(string: stationsRequestAPI) else {
                if kDebugLog { print("stationDataURL not a valid URL") }
                success(nil)
                return
            }
            
            loadDataFromURL(url: stationRequestAPI) { data, error in
                let json = String(data: data!, encoding: String.Encoding.utf8)
                print(json!)
                success(data)
            }

        }
    }
    
    /// This function returns a *hello* string for a given `subject`.
    ///
    /// - Warning: The returned string is not localized.
    ///
    /// Usage:
    ///
    ///     println(hello("Markdown")) // Hello, Markdown!
    ///
    /// - Parameter subject: The subject to be welcomed.
    ///
    /// - Returns: A hello string to the `subject`.
    static func postRequestDataWithSuccess(url: URL, success: @escaping ((_ metaData: Data?) -> Void)) {
        
        DispatchQueue.global(qos: .userInitiated).async {

            let headers = [
                "x-api-key": stationAPIXKey,
                "cache-control": "no-cache",
            ]
            
            let request = NSMutableURLRequest(url: url,
                                              cachePolicy: .useProtocolCachePolicy,
                                              timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error!)
                } else {
                    //let httpResponse = response as? HTTPURLResponse
                    let json = String(data: data!, encoding: String.Encoding.utf8)
                    print(json!)
                    //print(httpResponse)
                    success(data)
                }
            })
            
            dataTask.resume()

        }
    }
    
    //*****************************************************************
    // Load local JSON Data
    //*****************************************************************
    
    static func getDataFromFileWithSuccess(success: (_ data: Data?) -> Void) {
        guard let filePathURL = Bundle.main.url(forResource: "stations", withExtension: "json") else {
            if kDebugLog { print("The local JSON file could not be found") }
            success(nil)
            return
        }
        
        do {
            let data = try Data(contentsOf: filePathURL, options: .uncached)
            success(data)
        } catch {
            fatalError()
        }
    }
    
    //*****************************************************************
    // REUSABLE DATA/API CALL METHOD
    //*****************************************************************
    
    static func loadDataFromURL(url: URL, completion: @escaping (_ data: Data?, _ error: Error?) -> Void) {
        
        let headers = [
            "x-api-key": "1219751622122bd3:2350fbd6db11edfa37d7d63938189140",
            "cache-control": "no-cache"
        ]
        
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.allowsCellularAccess = true
        sessionConfig.timeoutIntervalForRequest = 15
        sessionConfig.timeoutIntervalForResource = 30
        sessionConfig.httpMaximumConnectionsPerHost = 1
        sessionConfig.httpAdditionalHeaders = headers
        
        let session = URLSession(configuration: sessionConfig)
        
        // Use URLSession to get data from an NSURL
        let loadDataTask = session.dataTask(with: url) { data, response, error in
            
            guard error == nil else {
                completion(nil, error!)
                if kDebugLog { print("API ERROR: \(error!)") }
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                completion(nil, nil)
                if kDebugLog { print("API: HTTP status code has unexpected value") }
                return
            }
            
            guard let data = data else {
                completion(nil, nil)
                if kDebugLog { print("API: No data received") }
                return
            }
            
            // Success, return data
            completion(data, nil)
        }
        
        loadDataTask.resume()
    }
}
