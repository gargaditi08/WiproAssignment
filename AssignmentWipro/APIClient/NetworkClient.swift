//
//  NetworkClient.swift
//  AssignmentWipro
//
//  Created by Aditi Garg on 05/04/20.
//  Copyright © 2020 Aditi Garg. All rights reserved.
//

import Foundation
import UIKit

public typealias NetworkRouterCompletionHandler = (_ data: Data?,_ response: URLResponse?, _ error: Error?)->()

final class NetworkClient
{
    private var task : URLSessionTask?
    
    func loadRequest(_ request : URLRequest, completion: @escaping NetworkRouterCompletionHandler) {
        
        let session = URLSession.shared
        do {
            task = session.dataTask(with: request, completionHandler: { data, response, error in
                DispatchQueue.main.async {
                    completion(data, response, error)
                }
        })
    }
        self.task?.resume()
}

    func cancel(){
        self.task?.cancel()
}
}
