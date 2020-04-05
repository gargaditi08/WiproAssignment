//
//  TableListService.swift
//  AssignmentWipro
//
//  Created by Aditi Garg on 05/04/20.
//  Copyright © 2020 Aditi Garg. All rights reserved.
//

import UIKit
import Foundation


protocol ResponseHandler {
    func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>
}

extension ResponseHandler {
  func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
    switch response.statusCode {
    case 200: return .success
    case 422: return .failure(ErrorResponse(rawValue: ErrorResponse.serverValidationError.rawValue)!)
    case 500: return .failure(ErrorResponse(rawValue: ErrorResponse.internalServerError.rawValue)!)
    default: return .failure(ErrorResponse(rawValue: ErrorResponse.unknownError.rawValue)!)
        
        }
    }
    
}

final class TableListService : ResponseHandler {
    
    
    var networkClient : NetworkClient =  NetworkClient()
    
    func getDataList(_ params: [String:Any], requestCompletion : @escaping (_ object: [CanadaUpdates]?,_ error: String?)->()) {
        
        guard let url = URL(string: "") else {
            requestCompletion(nil, "Invalid URL"); return }
        
        let request = URLRequest(url: url)
        self.networkClient.loadRequest(request) { data, response, error in
    
            guard let httpResponse = response as? HTTPURLResponse else {
                requestCompletion(nil, "Invalid HTTP Response")
                return
            }
            
            let result = self.handleNetworkResponse(httpResponse)
            switch result {
            case .success:
                guard let responseData = data else {
                    return
                }
                do {
                    let jsonData = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                    print(jsonData)
                    
                    var  canadaData :[CanadaUpdates] = []
                    if let jsonResponse = jsonData as? [[String:Any]]{
                        for data in jsonResponse{
                            let dataCanada = try CanadaUpdates(from: data as! Decoder)
                            canadaData.append(dataCanada)
                        }
                    }
                    requestCompletion(canadaData,nil)
                    
                }catch {
                    print(error)
                    requestCompletion(nil,"error in response")
                }
                print("")
            case .failure( _):
                print("")
                
            }
         }
    }
    
}
 
