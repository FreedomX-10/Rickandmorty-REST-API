//
//  rickandmortyModel.swift
//  rickandmorty
//
//  Created by Akkarin Phain on 24/9/2563 BE.
//

import Foundation


//struct Post:Codable {
//
//    var userId: Int!
//    var id: Int!
//    var title: String!
//    var body: String!
//
//}


func fetchPostData(completionHandler: @escaping ([Post]) -> Void)   {
//        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    
    let url = URL(string: "https://rickandmortyapi.com/api/character")!
    
    
    let task = URLSession.shared.dataTask(with: url){
        (data,response,erroe) in
        
        guard let data = data else {return}
        
        do {
            let postsData = try JSONDecoder().decode([Post].self, from: data)
            
            completionHandler(postsData)
        }
        catch{
            let error = error
            print(error.localizedDescription)
        }
        
    }.resume()
}

}




//let url = "https://rickandmortyapi.com/api/character"

struct Post:Codable {
    let count: Int!
    let pages: Int!
    let next : String!
    let prev: String!
    let data: [User]!
    let image: [Image]!
    let local:[location]!
//    let image: image!
    enum CodingKeys:String,CodingKey {

        case count
        case pages
        case next
        case prev
        case data = "result"
        case image
        case local = "Origing"

    }
}
struct User:Codable {
    let id: Int!
    let name : String!
    let status : String!
    let species: String!
    let type: String!
    let gender: String!

    enum CodingKeys:String,CodingKey {
        case id,name
        case species
        case type
        case gender
        case status
    }

}
struct Image:Codable {
    let images : String!
    
}

struct location:Codable {
    let loc: String!
}

