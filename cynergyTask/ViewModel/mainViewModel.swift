//
//  mainViewModel.swift
//  cynergyTask
//
//  Created by Mohammad Rishan Rashid on 22/01/24.
//

import Foundation
import Alamofire

class mainViewModel: NSObject {
var escapeModel: EscapeModel?

        func getAuthToken(url: String, completion: @escaping (Result<String, Error>) -> Void) {
            let secretKey = "402620C92552D9303C58B901B43B0A41718E772C19520DD9A9AA52CE5A8FCB99"
            let deviceType = "2"
            let deviceId = "CI-1236874289"
            let pushToken = ""
            
            let parameters: [String: Any] = [
                "secret_key": secretKey,
                "device_type": deviceType,
                "device_id": deviceId,
                "push_token": pushToken
            ]

            serviceFile.shared.performRequest(url: url, parameters: parameters) { [weak self] result in
                guard let self = self else { return }

                switch result {
                case .success(let data):
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(EscapeModel.self, from: data)
                        print("Decoding successful. Token: \(result.token)")
                        self.escapeModel = result
                        completion(.success(result.token ?? ""))
                    } catch let decodingError {
                        completion(.failure(decodingError))
                    }

                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    
    func loginViewModel(url: String, completion: @escaping (Result<String, Error>) -> Void) {
        let deviceType = "2"
        let deviceId = "CI-1236874289"
        let login_type = "2"
        
        let parameters: [String: Any] = [
            "device_type": deviceType,
            "device_id": deviceId,
            "login_type": login_type
        ]

        serviceFile.shared.loginRequest(url: url, parameters: parameters) { [weak self] result in
            guard let self = self else { return }

            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(EscapeModel.self, from: data)
                    print("Decoding successful. Token: \(result.token!)")
                    self.escapeModel = result
                    completion(.success(result.token ?? ""))
                } catch let decodingError {
                    completion(.failure(decodingError))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

}
