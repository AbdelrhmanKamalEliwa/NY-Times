//
//  ArticlesInteractor.swift
//  NY-Times
//
//  Created by Abdelrhman Eliwa on 04/12/2020.
//

import Foundation

class ArticlesInteractor {
    
    func getArticles(_ period: String, completionHandler: @escaping (ArticlesModel?, Error?) -> ()) {
        let networkManager = NetworkManager()
        
        _ = networkManager.request(
            url: EndPointRouter.getArticles(period: period),
            httpMethod: .get,
            parameters: nil,
            headers: nil) { (result: APIResult<ArticlesModel?>) in
            switch result {
            case .success(let data):
                completionHandler(data, nil)
            case .failure(let error):
                completionHandler(nil, error)
            case .decodingFailure(let error):
                completionHandler(nil, error)
            case .badRequest(let error):
                completionHandler(nil, error)
            }
        }
    }
}
