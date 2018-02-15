//
//  NetworkProcessor.swift
//  Liq
//
//  Created by Chidi Emeh on 2/14/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation


class NetworkProcessor {
    
    //Properties
    let url : URL
    lazy var configuration : URLSessionConfiguration = URLSessionConfiguration.default
    lazy var session : URLSession = URLSession(configuration: configuration)
    
    init(url: URL) {
        self.url = url
    }
    
    typealias JSONObject = ( (Codable?) -> Void  )
    typealias DataHandler = ( (Data?, HTTPURLResponse?, Error?) -> Void  )
    
    //Downloads json for a url
    func downloadJSONFromURL(_ completion : @escaping JSONObject ){
        var request = URLRequest(url: url)
    request.addValue("Token MDoxZGM4YzEyNC0wZGJmLTExZTgtOWY5OC0xMzBmNThhZGUyNWM6bFIyRERBRnJkYzBKQW4zcjhsYWZDdUQ4RG00VWh5SmdkMUJK", forHTTPHeaderField: "Authorization")
    
        
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200:
                        if let responseData = data {
                            do{
                                var downloadedObject : Codable?
                                downloadedObject = try JSONDecoder().decode(DrinkResponse.self, from: responseData)
                                completion(downloadedObject)
                            }catch let error as NSError {
                                print("Error decoding: \(error)")
                            }
                        }
                    default:
                        print("Response Status code: \(httpResponse.statusCode)")
                    }
                }
            }else {
                print(error?.localizedDescription ?? "Error downloading task")
            }
        }
        dataTask.resume()
        
    }
    
    //Downloads ImageData from URL
    func downloadImageDataFromURL( _ completion : @escaping DataHandler ){
        let request = URLRequest(url: url)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if error == nil {
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 200:
                        if let responseData = data {
                            completion(responseData, nil, nil)
                        }
                    default:
                        return
                    }
                }
            }else {
                completion(nil, nil, error!)
            }
        }
        dataTask.resume()
    }
    
    
    
    
}// End class NetworkProcessor
