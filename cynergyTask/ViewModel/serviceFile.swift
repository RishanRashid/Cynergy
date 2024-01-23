//
//  serviceFile.swift
//  cynergyTask
//
//  Created by Mohammad Rishan Rashid on 22/01/24.
//



import Foundation
import Alamofire

class serviceFile {

        static let shared = serviceFile()

        private init() {}

        func performRequest(url: String, parameters: [String: Any], completion: @escaping (Result<Data, Error>) -> Void) {
            guard let serviceURL = URL(string: url) else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }

            var request = URLRequest(url: serviceURL)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            } catch {
                completion(.failure(error))
                return
            }

            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                    return
                }

                if let data = data {
                    completion(.success(data))
                }
            }

            task.resume()
        }
    
    func loginRequest(url: String, parameters: [String: Any], completion: @escaping (Result<Data, Error>) -> Void) {
        let storedToken = UserDefault.shared.getAccessToken()
        print("Stored token: \(storedToken)")
        
        guard let serviceURL = URL(string: url) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }

        var request = URLRequest(url: serviceURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer" + storedToken, forHTTPHeaderField: "Authorization")

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch {
            completion(.failure(error))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data {
                completion(.success(data))
            }
        }

        task.resume()
    }
    }
