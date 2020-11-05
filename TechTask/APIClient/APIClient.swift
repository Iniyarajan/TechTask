//
//  APIClient.swift
//  TechTask
//
//  Created by MAC on 03/07/19.
//  Copyright © 2020 MAC. All rights reserved.
//

import Foundation


enum APIError:Error{
    case urlError
    case decodingError
    case networkError
}

extension APIError{
    
    func toString() -> String{

        switch self {
        case .urlError:
            return "Unidentified url"
        case .decodingError:
            return "The data couldn’t be read because it isn’t in the correct format"
        case .networkError:
            return "Something went wrong. Please try again Later."
        }

    }
    
}

class APIClient{
    
    static let shared = APIClient()
    
    func loadData(urlString:String, completion:@escaping(Result<Canada, APIError>) -> Void){
     
        guard let url = URL(string:urlString) else{
            completion(.failure(.urlError))
            return
            
        }
    
        URLSession.shared.dataTask(with: url) { (data, response, error) in

            if error != nil{
                completion(.failure(.networkError))
                return
            }

            if let httpUrlresponse = response as? HTTPURLResponse,200..<300 ~= httpUrlresponse.statusCode,let responseData = data{
                do{
                    
                   //get json string from responseData
                    let jsonString = String(decoding: responseData, as: UTF8.self)

                    //convert json string to Data and pass it to jsondecoder
                    guard let jsonData = jsonString.data(using: .utf8) else{
                        completion(.failure(.decodingError))
                        return
                    }
                    
                    let canada = try JSONDecoder().decode(Canada.self, from: jsonData)
                    completion(.success(canada))

                }catch{
                    print(error.localizedDescription)
                    completion(.failure(.decodingError))
                }
            }else{
                completion(.failure(.networkError))
            }

        }.resume()
            
    }
    
}
