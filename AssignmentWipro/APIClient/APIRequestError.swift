//
//  APIRequestError.swift
//  AssignmentWipro
//
//  Created by Aditi Garg on 05/04/20.
//  Copyright © 2020 Aditi Garg. All rights reserved.
//

import Foundation

enum ErrorResponse : String {
    case invalidJson = "Invalid response. Data can not be decoded."
    case authenticationFailure = "You need to be authenticated first."
    case badRequest = "Bad Request."
    case noInternetConnection = "Internet connection not available."
    case serverValidationError = "ServerValidation error"
    case internalServerError = "Internal server error."
    case unknownError = "Unknown Error"

}


enum Result<String>{
    case success
    case failure(ErrorResponse)
    
}

class APIRequestError {
    
    var errorCode: Int?
    var errorTitle : String? {
        return nil
    }
    
    var errorMessage : String?{
        return nil
    }
    
    var error: String?
    
    var dictError : Dictionary<String,Any>?
    
}
