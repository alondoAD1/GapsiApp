//
//  NetworkingService.swift
//  GapsiApp
//
//  Created by Ricardo Alonso Diaz Alvarado on 23/04/23.
//

import Foundation

import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case HEAD = "HEAD"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
    case CONNECT = "CONNECT"
    case OPTIONS = "OPTIONS"
    case TRACE = "TRACE"
    case PATCH = "PATCH"
}

enum NetworkError: String, Error {
    case invalidURL
    case serializationFailed
    case generic
    case couldNotDecodeData
    case httpResponseError
    case statusCodeError = "Oucrrio un error al tratar de consultar el Api: status code"
    case jsonDecoder = "Error al intentar extraer datos del Json."
    case unauthorized
}

@MainActor
class NetworkingService {
    
    public static var shared: NetworkingService = NetworkingService()
    private static let baseURL = "https://00672285.us-south.apigw.appdomain.cloud/demo-gapsi/search?"
    static func request<T: Decodable>(endPoint: String,
                                      parameters: [String: Any]? = nil,
                                      model: T.Type,
                                      method: HTTPMethod) async throws -> T {
        
        guard let url = URL(string: baseURL + endPoint) else {
            throw NetworkError.invalidURL
        }

        var json: [String: Any] = [:]
        json = parameters ?? [:]
        let parameters = try? JSONSerialization.data(withJSONObject: json)
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("adb8204d-d574-4394-8c1a-53226a40876e", forHTTPHeaderField: "X-IBM-Client-Id")
        if !(json.isEmpty) { request.httpBody = parameters }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.httpResponseError
            }
            
            if httpResponse.statusCode > 299 { throw NetworkError.statusCodeError }
            
            let decoder = JSONDecoder()
            do {
                let decodeData = try decoder.decode(T.self, from: data)
                return decodeData
            } catch { throw NetworkError.couldNotDecodeData }
        } catch { throw NetworkError.generic }
        
    }
    
}
