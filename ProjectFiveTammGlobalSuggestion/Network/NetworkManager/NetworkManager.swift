//
//  NetworkManager.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 24/05/23.
//

import Foundation

protocol NetworkManagerType{
    func fetchApiData<T: Decodable>(endPoint :ParentSearchEndPoint, completionHandler: @escaping (Result<T,Error>)->())
}

class NetworkManager: NetworkManagerType {
    func fetchApiData<T: Decodable>(endPoint :ParentSearchEndPoint, completionHandler: @escaping (Result<T,Error>)->()) {
        var queryItems: [URLQueryItem] = []
        endPoint.parameters?.forEach({ (key,value) in
            let queryItem = URLQueryItem(name: key.rawValue, value: value)
            queryItems.append(queryItem)
        })
        var urlComponents = URLComponents(string: endPoint.baseUrl + endPoint.endPointUrl)
        urlComponents?.queryItems = queryItems
        guard let url = urlComponents?.url else { return }
        var requestUrl = URLRequest(url: url)
        requestUrl.httpMethod = endPoint.httpMethod
        requestUrl.allHTTPHeaderFields = endPoint.headers
        requestUrl.httpBody = endPoint.body
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                completionHandler(.failure(error!) )
            }
            guard let response = response else {
                //TODO: response is not used anywhere
                completionHandler(.failure(error!) ) //TODO: Please advice Error Handling is correct ?
                return
            }
            guard let data = data else {
                completionHandler(.failure(error!) ) //TODO: Please advice Error Handling is correct ?
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(T.self,from: data)
                //TODO: Even though we have try, crash is not going to catch. How do we handle crash in Try-Catch.
                if let movies = jsonData as? T {
                    //TODO:  jsonData as? T  -- is this correct ?
                    print(movies)
                    completionHandler(.success(movies))
                }
            } catch let exp {
                completionHandler(.failure(exp) ) //TODO: Please advice Error Handling is correct ?
            }
        }.resume()
    }
}
