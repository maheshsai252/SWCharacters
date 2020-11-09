//
//  loadFromAPI.swift
//  SW Characters
//
//  Created by Mahesh sai on 27/10/20.
//

import Foundation
import Combine


// MARK: - Load Characters From API

class APIManager {
    var url: String
    
    init(url:String) {
        self.url = url
    }
    
    func loadCharactersFromURL() -> AnyPublisher<Results,Error> {
        LoadHelper.loadFromAPI(with: url)
    }
}

class LoadHelper {
    static func loadFromAPI(with url:String) -> AnyPublisher<Results,Error> {
        guard let url = URL(string: url) else {
            return Fail(error: NSError(domain:"", code: 404, userInfo:nil) )
                .eraseToAnyPublisher()
        }
        
        let session = URLSession(configuration: .default)
        
        return session.dataTaskPublisher(for: url)
            .tryMap({ response -> Data in
                return response.data
            })
            .decode(type: Results.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
        
    }
}
