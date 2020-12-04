//
//  EndPointRouter.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 04/12/2020.
//

import Foundation

struct EndPointRouter {
    
    static var APIKey: String {
        return APIService.APIKey()
    }
    
    static func getArticles(period: String) -> URL {
        return URL(string:
                    APIService.baseURL() + "mostviewed/all-sections/" +
                    period + ".json?api-key=" + APIKey)!
    }
}
