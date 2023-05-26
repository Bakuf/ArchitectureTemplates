//
//  NetworkManager.swift
//  Architecture Templates
//
//  Created by Rodrigo Galvez on 13/05/23.
//

//Free Testing API from https://jsonplaceholder.typicode.com/

import Foundation

protocol NetworkModel : Decodable {
    static var networkRoute : NetworkManager.Routes { get }
}

extension NetworkModel {
    static func makeRequest(id: Int? = nil,delay: TimeInterval = 0, completion: @escaping (Result<[Self], NetworkManager.NetworkError>) -> Void) {
        NetworkManager.shared.request(model: self, id: id, delay: delay, completion: completion)
    }
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    enum Routes : String {
        case posts
        case comments
        case albums
        case photos
        case todos
        case users
    }
    
    enum NetworkError: Error {
        case badHttpRequest(error: Error)
        case parsing(error: Error)
    }
    
    struct Constants {
        static let baseUrl = "https://jsonplaceholder.typicode.com/"
    }
    
    static func fullUrl<m: NetworkModel>(for model: m.Type) -> URL? {
        URL(string: Constants.baseUrl + "\(model.networkRoute.rawValue)")
    }
}

//MARK: - Block Request
extension NetworkManager {
    func request<m: NetworkModel>(model:m.Type, id: Int? = nil, delay: TimeInterval, completion: @escaping (Result<[m], NetworkError>) -> Void) {
        guard let url = URL(string: Constants.baseUrl + "\(model.networkRoute.rawValue)" + (id == nil ? "" : "/\(id!)")) else { return }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        Thread.sleep(forTimeInterval: delay)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let models = try JSONDecoder().decode([m].self, from: data)
                    completion(.success(models))
                } catch {
                    completion(.failure(.parsing(error: error)))
                }
            } else if let error = error {
                completion(.failure(.badHttpRequest(error: error)))
            }
        }
        .resume()
    }
}
