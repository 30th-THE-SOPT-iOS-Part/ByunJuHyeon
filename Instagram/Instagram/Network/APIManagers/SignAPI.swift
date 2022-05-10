//
//  SignAPI.swift
//  Instagram
//
//  Created by 변주현 on 2022/05/10.
//

import Foundation
import Alamofire

class SignAPI {
    static let shared = SignAPI()
    
    private init() {}
}

// MARK: - judge status & data
extension SignAPI {
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400: return .pathErr
        case 500: return .serverErr
        default: return .networkFail
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<SigninDataModel>.self, from: data)
        else { return .pathErr }
        
        return .success(decodedData as Any)
    }
}

// MARK: - API
extension SignAPI {
    // MARK: [POST] signin
    func signin(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void)
    {
        
        let url = APIConstants.signinURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "name": email, // email값을 임의의 name으로 지정
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                    method: .post,
                                    parameters: body,
                                    encoding: JSONEncoding.default,
                                    headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    // MARK: [POST] signup
    func signup(email: String,
               password: String,
               completion: @escaping (NetworkResult<Any>) -> Void)
    {
        
        let url = APIConstants.signinURL
        let header: HTTPHeaders = ["Content-Type" : "application/json"]
        let body: Parameters = [
            "name": email, // email값을 임의의 name으로 지정
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url,
                                    method: .post,
                                    parameters: body,
                                    encoding: JSONEncoding.default,
                                    headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            
            case .failure:
                completion(.networkFail)
            }
        }
    }
}
