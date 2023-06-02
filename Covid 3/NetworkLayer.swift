//
//  NetworkLayer.swift
//  Covid 3
//
//  Created by Yogesh Tekwani on 6/1/23.
//

import Foundation

func reqUrl(completionHandler: @escaping (allData?) -> ()){
    
    let url = URL(string: "https://data.covid19india.org/v4/min/data.min.json")
    let urlReq = URLRequest(url: url!)
    
    let task = URLSession.shared.dataTask(with: urlReq, completionHandler: { data, response, error in
        
        if error != nil {
            print(error?.localizedDescription)
            print(error)
            completionHandler(nil)
            return
        }
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print(error?.localizedDescription)
            print(error)
            completionHandler(nil)
            return
        }
        
        if let strData = String(data: data!, encoding: .utf8){
            print(strData.count)
            //print(strData)
        }
        
        if let data = data {
            print("Inside Data")
            do{
                let decoder = JSONDecoder()
                let alld = try decoder.decode(allData.self, from: data)
                completionHandler(alld)
            }catch{
                print(error.localizedDescription)
                print(error)
                completionHandler(nil)
            }
        }
        
        
    })
    
    task.resume()
    
}
