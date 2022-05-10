//
//  APIConstants.swift
//  Instagram
//
//  Created by 변주현 on 2022/05/10.
//

import Foundation

struct APIConstants {
    // MARK: - Base URL
    static let baseURL = "http://13.124.62.236"
    
    // MARK: - Feature URL
    static let signinURL = baseURL + "/auth/signin"
    static let signupURL = baseURL + "/auth/signup"
}
