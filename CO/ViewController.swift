//
//  ViewController.swift
//  CO
//
//  Created by Rajesh Parimala on 03/11/22.
//

import UIKit
import Cosmos
import TinyConstraints
class ViewController: UIViewController {

    @IBOutlet weak var cosmos: CosmosView!{
        didSet{
                var view = CosmosView()
        //        view.settings.updateOnTouch = false
            cosmos.settings.filledImage = UIImage(named: "RatingStarFilled")?.withRenderingMode(.alwaysOriginal)
            cosmos.settings.emptyImage = UIImage(named: "RatingStarEmpty")?.withRenderingMode(.alwaysOriginal)
                
            cosmos.settings.totalStars = 5
            cosmos.settings.starSize = 35
            cosmos.settings.starMargin = 3.3
            cosmos.settings.fillMode = .precise
                
              //  view.text = "Rate me"
              //  view.settings.textColor = .red
              //  view.settings.textMargin = 10
           
        }
             
            }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cosmos.didTouchCosmos = { rating in
                 print("Rated: \(rating)")
             }
    }


}

