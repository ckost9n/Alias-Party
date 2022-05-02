//
//  JokeManager.swift
//  Alias Party
//
//  Created by Андрей Яфаркин on 02.05.2022.
//

import Foundation

protocol JokeManagerDelegate {
    func didUpdateJoke(joke: JokeModel, punchline: JokeModel)
}

struct JokeManager {
    
    var delegate: JokeManagerDelegate?
    
    func getJoke() {
        let urlString = "https://joke.deno.dev"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, responce, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let  text = self.parseJSON(jokeData: safeData), let punchline = self.parseJSON(jokeData: safeData) {
                        self.delegate?.didUpdateJoke(joke: text, punchline: punchline)
                    }
                    
                }
            }
            task.resume()
        }
        
    }
    
    func parseJSON(jokeData: Data) -> JokeModel? {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode(JokeData.self, from: jokeData)
            let id = decodedData.id
            let joke = decodedData.setup
            let punchline = decodedData.punchline
            
            let randomJoke = JokeModel(id: id, setup: joke, punchline: punchline)
            return randomJoke
        }
        catch {
            print(error)
            return nil
        }
    }
    
}
