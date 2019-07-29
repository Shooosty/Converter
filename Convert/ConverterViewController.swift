//
//  ViewController.swift
//  Convert
//
//  Created by Macbook on 27/07/2019.
//  Copyright © 2019 Technology&Design LLC. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        request("https://revolut.duckdns.org/latest?base=EUR").responseJSON { response in
            print(response)
        }
        print("viewDidLoad ended")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (touches.first) != nil {
            view.endEditing(true)
        }
    }
}

