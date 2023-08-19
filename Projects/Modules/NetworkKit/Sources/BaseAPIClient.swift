import Alamofire

import Foundation

public final class BaseAPIClient {
    
    public init() {}
    
    let apiURLString: String = Bundle.main.object(forInfoDictionaryKey: "API_URL") as? String ?? "없음"
    
    private(set) var session: Session = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 10
        configuration.timeoutIntervalForResource = 10
        return Session(configuration: configuration)
    }()
    
    public func requestJSON<T: Decodable>(
        _ url: String,
        type: T.Type,
        method: HTTPMethod,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? = nil
    ) async throws -> (T?, Error?) {
        let request: DataRequest = session.request(
            "http://" + apiURLString + url,
            method: method,
            parameters: parameters,
            encoding: method == .get ? URLEncoding.default : JSONEncoding.default,
            headers: headers
        )
        
        let task = request.serializingDecodable(type)
        var responseValue: T?
        var responseError: AFError?
        
        switch await task.result {
        case .success(let value): responseValue = value
        case .failure(let error): responseError = error
        }
        
        return (responseValue, responseError)
    }
}
