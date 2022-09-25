//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Hakan Baran on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tryLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func getRatesClicked(_ sender: Any) {
        
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/CurrencyData/main/currency.json")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data1, response1, error1 in
            
            if error1 != nil {
                
                let alertMessage = UIAlertController(title: "ERROR", message: error1.debugDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alertMessage.addAction(okButton)
                
                self.present(alertMessage, animated: true, completion: nil)
                
            } else {
                
                if data1 != nil {
                    
                    do{
                    let jsonResponse = try JSONSerialization.jsonObject(with: data1!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            
                            if let rates = jsonResponse["rates"] as? [String: Any] {
                                
                                if let TL = rates["TRY"] as? Double {
                                    self.tryLabel.text = "CAD: \(TL)"
                                }
                                
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: \(usd)"
                                }
                                
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "CAD: \(jpy)"
                                }
                                
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: \(gbp)"
                                }
                                
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: \(chf)"
                                }
                                
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: \(cad)"
                                }
                            }
                        }
                    } catch {
                        print("Error 1")
                    }
                }
            }
        }
        task.resume()
    }
}

