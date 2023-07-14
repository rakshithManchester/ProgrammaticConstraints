//
//  Constants.swift
//  ProjectFiveTammGlobalSuggestion
//
//  Created by Appaiah on 24/05/23.
//

import Foundation

enum constants {
    enum Api: String {
        case baseUrl = "https://api.abudhabi.ae/gateway/TammJourneyMobileRequestProxyClient/1.0/sitecore/"
    }
    enum ParentSearchEndApi: String {
        case suggestionEndPoint = "getSuggestions"
        case searchEndPoint = "searchResults"
    }
}
enum ParameterKeys: String {
    case lang = "lang"
    case resFormat = "resFormat"
    case count = "count"
    case term = "term"
    case query = "query"
    case offset = "offset"
    case nationality = "nationality"
    case pageSize = "pageSize"
}
protocol EndPointTypeTwo {
    var parameters: [ParameterKeys:String]? {get}
    var baseUrl: String {get}
    var body: Data? {get}
    var httpMethod: String? {get}
    var endPointUrl: String {get}
    var headers: [String: String]? {get}
}
enum HttpMethodNew: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}
enum ParentSearchEndPoint: EndPointTypeTwo {
    case getSuggestion(suggestText: String)
    case searchResults(searchText: String)
    var parameters: [ParameterKeys: String]? {
        switch self {
        case .getSuggestion(let suggestText):
            return [.lang:"en",.resFormat:"json",.count:"10",.term:suggestText]
        case .searchResults(let searchText):
            return [.resFormat:"json",.lang:"en",.offset:"0",.query:searchText,.nationality:"0",.pageSize:"15"]
        }
    }
    var baseUrl: String {
        switch self {
        default:
            return constants.Api.baseUrl.rawValue
        }
    }
    var body: Data? {
        switch self {
        case .getSuggestion:
            return nil
        case .searchResults:
            return nil
        }
    }
    var httpMethod: String? {
        switch self {
        default:
            return HttpMethodNew.get.rawValue
        }
    }
    var endPointUrl: String {
        switch self {
        case .getSuggestion:
            return constants.ParentSearchEndApi.suggestionEndPoint.rawValue
        case .searchResults:
            return constants.ParentSearchEndApi.searchEndPoint.rawValue
        }
    }
    var headers: [String: String]? {
        switch self {
        default:
            return ["UserToken":"eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJBdXRob3JpdHkiOiJUQU1NIiwidXVpZCI6IkMzQkQyNDI0LThDNDktQzJCQS1DNjc1LTI5RUU2NTQ5NDU2OSIsImV4cCI6MTY4OTIzMzU3MCwia2V5IjoicU9HSnZmVkV2QnBMeVpuczExNm1NVS83c2xad1ZvQlBOWGhheHhGcEhJZDFkOW9WUG12Qlh4VGVoY1lxNHN0eSIsImF1ZCI6Im1vYmlsZSIsInN1YiI6IkMzQkQyNDI0LThDNDktQzJCQS1DNjc1LTI5RUU2NTQ5NDU2OSIsIm5vbmNlIjoiIiwiaWF0IjoxNjg2NjQxNTcwfQ.Dn8y5V48s2Kulixhqe3kmN1ki0XXqBzl1GEYQbGG4PUEgOPIZrXX32eeSEY3U_EaE8FbY_AJbUzxNnFTdYANcqj7t25_gAdRIrhwEvYXH-M0H0uKrt9GCjt4jyeNRJsQKO8LYSzvCRMd9uAaI-vd9CLOgHToG7xvi4LItAqzIxGXyI4ln9GLkd04v9znMVDlZ3oWFZ0eK00eNeQNxCe9RAGWKpf9wnrEkjaC4VRmDPpS01K7B99oaujga-pSTIZt0-FSXhulGQvK9LcshBgKb0tgnTG7K5CGP9tM6o8qCJnHoJSazMOz2eA2kMI0nNN2Gfh_P_az-Kl2wG-DlxBnUA071BGEEEeEuChDc9_aC7A-yD6WSrf0RR3cQJx0wd7EuIRTUX2ZbL70lRqh72HJzJYzyBEtTeB4X4Sc8LN5QhhhrGV9qJi4VeQDxYeiYzW1U3ROiFOcO4VpVpJxrj7UJmCfJzjGhvkkYyfcNZGrBt9fyTcIoI-YZlGwb9Rkdwtr9kh8iqYl5aqMvZe7ItvhzlZEnXwq1A9EjcSnwg7ASg0YsPDcLNsisXC1DxunNM3G-NR4VWyPJxS5rL4XB6LGgiyTKv9p1A7YvHVytIwDM786Ri4HPDUaF6pE9F2-gNXJ8r3hgg84UFspIQipypmqBCvTsE0q6MVktnAqnKSpMxo","Content-Type":"application/json","Accept":"application/json"]
        }
    }
}
