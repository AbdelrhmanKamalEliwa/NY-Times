//
//  APIEnvironmentPath.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 04/12/2020.
//

import Foundation

struct APIService {
    static func baseURL() -> String {
        return APIEnvironmentPath.production.scheme() + APIEnvironmentPath.production.host() + "/svc/mostpopular/v2/"
    }
    
    static func APIKey() -> String {
        return APIEnvironmentPath.production.APIKey()
    }
}

enum APIEnvironmentPath {
    
    case development
    case testing
    case production
    
    func scheme() -> String {
        switch self {
        case .development:
            return "http://"
        case .testing:
            return "http://"
        case .production:
            return "https://"
        }
    }
    
    func host() -> String {
        switch self {
        case .development:
            return "api.nytimes.com"
        case .testing:
            return "api.nytimes.com"
        case .production:
            return "api.nytimes.com"
        }
    }
    
    func APIKey() -> String {
        switch self {
        case .development:
            return "CuIWro5sOySf6zo5QqXG8PfaMZuyKXrs"
        case .testing:
            return "CuIWro5sOySf6zo5QqXG8PfaMZuyKXrs"
        case .production:
            return "CuIWro5sOySf6zo5QqXG8PfaMZuyKXrs"
        }
    }
}
