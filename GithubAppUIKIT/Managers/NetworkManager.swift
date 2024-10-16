//
//  NetworkManager.swift
//  GithubAppUIKIT
//
//  Created by MacBook Difta on 10/10/24.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://api.github.com/users/"
    let cache = NSCache<NSString, UIImage>()
    private init() {}
    
    
    func getFollower(for username: String, page: Int, completionHandler:  @escaping (Result<[Follower], GFError>) -> Void){
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        
        guard let url = URL(string: endpoint) else{
            completionHandler(.failure(.invalidUsername))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error{
                completionHandler(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else{
                completionHandler(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completionHandler(.success(followers))
            } catch{
                completionHandler(.failure(.invalidData))
                
            }
        }.resume()
        
    }
    
    func getUserInfo(for username: String, completionHandler:  @escaping (Result<User, GFError>) -> Void){
        let endpoint = baseURL + "\(username)"
        
        guard let url = URL(string: endpoint) else{
            completionHandler(.failure(.invalidUsername))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error{
                completionHandler(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else{
                completionHandler(.failure(.invalidData))
                return
            }
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let user = try decoder.decode(User.self, from: data)
                completionHandler(.success(user))
            } catch{
                completionHandler(.failure(.invalidData))
                
            }
        }.resume()
        
    }
    
}
