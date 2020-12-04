//
//  APIResult.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 04/12/2020.
//

import Foundation

enum APIResult<T> {
    case success(T)
    case failure(Error?)
    case decodingFailure(Error?)
    case badRequest(Error?)
}
