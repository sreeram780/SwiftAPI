//
//  ViewController.swift
//  SwiftRestAPI
//
//  Created by SreenivasulaReddy on 28/11/16.
//  Copyright © 2016 SreenivasulaReddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        func getLowScore() -> (a: String ,b : String ){
            return ("","")
        }
        
        
        
    func getAHighScore() -> (name: String, score: Int) {
            let theName = "Patricia"
            let theScore = 3894
            
            return (theName, theScore)
        }
    let name = getAHighScore().name
    let score = getAHighScore().score
        print(name)
        print(score)
        
        
         RestAPI.sharedInstance.hardProcessingWithString(input:"http://capture.qfund.net/vdirectory-v1/v2/login") { result  in
            print(result)
        }
    }
}

