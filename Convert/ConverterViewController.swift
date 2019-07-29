//
//  ViewController.swift
//  Convert
//
//  Created by Macbook on 27/07/2019.
//  Copyright © 2019 Technology&Design LLC. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ConverterViewController: UIViewController {
    
    let url = "https://revolut.duckdns.org/latest?base=EUR"
    
    @IBOutlet weak var dollar: UITextField!
    @IBOutlet weak var rub: UITextField!
    @IBOutlet weak var bat: UITextField!
    @IBOutlet weak var yen: UITextField!
    @IBOutlet weak var krone: UITextField!
    @IBOutlet weak var funt: UITextField!
    @IBOutlet weak var convertLabel: UILabel!
    
    @IBAction func tfUsa(_ sender: UITextField) {
    }
    
    @IBAction func tfRus(_ sender: UITextField) {
    }
    @IBAction func tfThai(_ sender: UITextField) {
    }
    @IBAction func tfJpn(_ sender: UITextField) {
    }
    @IBAction func tfBrit(_ sender: UITextField) {
    }
    @IBAction func tfCzk(_ sender: UITextField) {
    }
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,
                                     selector: #selector(currencyLoad),
                                     userInfo: nil, repeats: true)
    }
    
    @objc func currencyLoad(i: Double) {
        
        request(url).validate().responseJSON { responseJSON in
            switch responseJSON.result {
            case .success(let value):
                
                let json = JSON(value)
                let rub = json["rates"]["RUB"].doubleValue
                let usd = json["rates"]["USD"].doubleValue
                let thb = json["rates"]["THB"].doubleValue
                let jpy = json["rates"]["JPY"].doubleValue
                let czk = json["rates"]["CZK"].doubleValue
                let gbp = json["rates"]["GBP"].doubleValue
                print(rub, thb, usd, jpy, czk, gbp)
                
                
                self.rub.text = ("\(rub)")
                self.dollar.text = ("\(usd)")
                self.bat.text = ("\(thb)")
                self.yen.text = ("\(jpy)")
                self.krone.text = ("\(czk)")
                self.funt.text = ("\(gbp)")
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
