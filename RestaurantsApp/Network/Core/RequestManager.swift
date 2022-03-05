//
//  Request.swift
//  RestaurantsApp
//
//  Created by Kumail kashefi on 05/03/2022.
//


import UIKit
import Alamofire


protocol RequestProcessorDelegate{
    func processRequest(_ request:Request) -> Void
}

enum Result<T> {
    case success(T)
    case failure(Error)
}

class RequestManager: NSObject {
    static let shared = RequestManager()
    fileprivate override init() {}
}

//MARK:- RequestManager - Request
extension RequestManager {
 
    func request<T: Codable>(url: String,completion: @escaping (_ response: Result<T>) -> Void) {
        
        let request = AF.request("\(url)")
        
        request.responseDecodable(of: T.self) { (response) in
    
            switch response.result{
            case .success :
                guard let data = response.value else { return }
                completion( Result.success( data ) )
                
            case .failure(let error):
                completion(Result.failure(error))
            }
            
        }
    }
}

