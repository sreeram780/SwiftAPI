//
//  RESTAPI.swift
//  SwiftRestAPI
//
//  Created by SreenivasulaReddy on 28/11/16.
//  Copyright © 2016 SreenivasulaReddy. All rights reserved.
//

import Foundation

class RestAPI
{
    static let sharedInstance = RestAPI()
    private init() {}

    func requestWithURL(baseURL:String, params: [String : String])->(URLRequest)
    {
        let Keys = params.keys
        var postData = [String]()
        
        for (_, element) in Keys.enumerated()
        {
            let keyStr = element
            let valStr = params[element]
            postData.append(String(format:"%@=%@",keyStr,valStr! ))
        }
        let joinedStrings = postData.joined(separator: "&")
        let codeUrl = String (format:"%@?%@",baseURL,joinedStrings)
        let encodeUrl = codeUrl.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        let url = NSURL(string:encodeUrl!)

        let relReq = NSMutableURLRequest(url:url! as URL)
        relReq.cachePolicy = .useProtocolCachePolicy
        relReq.timeoutInterval = 120.0
       return relReq as (URLRequest)
    }
    
    func mutableRequestWithURL(baseURL:String, params: [String : AnyObject])->(URLRequest)
    {
        var relReq = NSMutableURLRequest()
        do {
            let jsonParmametrsData = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
            
            let url = NSURL(string:baseURL)
            print("Rest URL : %@",url!)
            
            relReq = NSMutableURLRequest(url:url! as URL)
            relReq.cachePolicy = .useProtocolCachePolicy
            relReq.timeoutInterval = 120.0
            relReq.httpMethod = "POST"
            relReq.value(forHTTPHeaderField: "application/json")
            relReq.httpBody = jsonParmametrsData
            return relReq as (URLRequest)

        }
        catch{}
       
      return relReq as (URLRequest)
    }


    func hardProcessingWithString(input: String, completion: @escaping (_ resultData: NSDictionary) -> Void)
    {
        let sessionData = URLSession.shared
        
        let payLoad:[String :String] = ["userName": "2606","password": "Mahesh2606","companyCode": "VTL"]
        
        let requestis = requestWithURL(baseURL: input, params: payLoad as [String : String])
        
        let task = sessionData.dataTask(with: requestis, completionHandler: {(data, response, error) -> Void in
            
            if let data = data
            {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode
                {
                    completion(json as! NSDictionary)
                }
                else
                {
                    completion(json as! NSDictionary)
                }
            }
        })
        task.resume()
    }
    
    
    func vcaptureLogin(input: String, completion: @escaping (_ resultData: NSDictionary) -> Void)
    {
        let sessionData = URLSession.shared
        
        let payLoad:[String :String] = ["userName": "2606","password": "Mahesh2606","companyCode": "VTL"]
        
        let requestis = requestWithURL(baseURL: input, params: payLoad as [String : String])
        
        let task = sessionData.dataTask(with: requestis, completionHandler: {(data, response, error) -> Void in
            
            if let data = data
            {
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let response = response as? HTTPURLResponse , 200...299 ~= response.statusCode
                {
                    completion(json as! NSDictionary)
                }
                else
                {
                    completion(json as! NSDictionary)
                }
            }
        })
        task.resume()
    }
}
