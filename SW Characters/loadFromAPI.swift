//
//  loadFromAPI.swift
//  SW Characters
//
//  Created by Mahesh sai on 27/10/20.
//

import Foundation
import Combine
class LoadHelper
{
    static func loadFromAPI()->AnyPublisher<results,Error>
    {
        print("loading")
        let url=URL(string: "https://swapi.dev/api/people")!
        
            let session=URLSession(configuration: .default)
//            let task=session.dataTask(with: url) {(data, response, error) in
//                if error != nil
//                {
//                    print(error!)
//                }
//                if let safedata=data{
//
//                    let decoder = JSONDecoder()
//                    do{
//                    let result=try decoder.decode(results.self, from: safedata)
//                       print(result)
//
//                    }
//                    catch
//                    {
//                        print(error)
//
//                    }
//                }
//
//            }
//            task.resume()
            return session.dataTaskPublisher(for: url)
                .tryMap({ response -> Data in
                    print(response.data)
                    return response.data
                })
                .decode(type: results.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
            
        
    }
}
