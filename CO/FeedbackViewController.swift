//
//  FeedbackViewController.swift
//  CO
//
//  Created by Rajesh Parimala on 03/11/22.
//

import UIKit

class FeedBackViewController: UIViewController {

    
    @IBOutlet weak var saveButton: UIButton! {
        didSet {
            saveButton.layer.cornerRadius   = 8
        }
    }
    
    
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var remarksView: UITextView!
    var feedbackListData = [FeedbackQuestionsList]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.reloadData()
        tableView.separatorColor = .clear
        tableView.backgroundColor = UIColor.black
        self.feedBackListAPICalling()
    }
    private func feedBackListAPICalling() {
       // if !self.checkInternetConnection(){
           // return
      //  }
        //let urlString = Constants.ApiUrlConstants.previousData
        
        let urlString =   "https://65.1.244.68/rtc-hrms/feedbackqs.php"
        
    //    let AccesskeyStr = "\(UserDefaults.standard.value(forKey: "accesskey") as? String ??  "")"
        
        let AccesskeyStr = "bce280f1cb9401bea8cd"
        var params:[String:Any] = [:]
        
       // let AccesskeyStr = "0dfb6b61b0324fc06a54"
        
        params["accesskey"] = AccesskeyStr

        let json = "{\"accesskey\":\"\(AccesskeyStr)\"}"
        let url = URL(string: urlString)!
        let jsonData = json.data(using: .utf8)
        print(urlString)
        print(params)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = jsonData
       // let activityIndicator = self.activityIndicator()
       // self.present(activityIndicator, animated: true,completion: {
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async { [self] in
                  //  self.hideLoader(loader: activityIndicator) {
                        print(String(data: data!, encoding: .utf8)!)
                        if error == nil && data != nil {
                            do {
                                let apiResponse = try JSONDecoder().decode(FeedbackQuestionListDataModel.self, from: data!)
                                if apiResponse.error == false {
                                    self.feedbackListData = apiResponse.feedbackquestionslist!
                                    self.tableView.reloadData()
                               }else if apiResponse.message == "Access denied!" {
                                } else if apiResponse.error == true {
                                    //self.showMessage(message: apiResponse.message ?? "")
                                }
                            } catch let error {
                                print(error)
                            }
                        } else {
                            print(error)
                        }
                   }
              //  }
            }.resume()
      //  })
    }

    @IBAction func backButtonClicked(_ sender: UIButton) {
    }
   
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        print("\(remarksView.text)")
        print("SUBMIT HERE")
    }
    
}

extension FeedBackViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedbackListData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedbackCell", for: indexPath) as! FeedbackCell
        let row = indexPath.row
        cell.numberLabel.text  = feedbackListData[row].sno! + " )"
        cell.questionLabel.text = feedbackListData[row].question
        
        cell.cosmosView.tag = row
        // MARK: - TAP GESTURE OF  READ MORE IN NEWS AND CIRCULAR
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(FeedBackViewController.tapFunction(sender:)))
        cell.cosmosView.isUserInteractionEnabled = true
        cell.cosmosView.addGestureRecognizer(tap1)
        
     //   cell.cosmosView.addTarget(self, action: #selector(tapFunction(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = footerView
       return footer
    }
    
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        let particularNumber = sender.view!.tag
        print("THE PARTICULAR ROW NUMBER WAS----\(particularNumber)")
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedbackCell") as! FeedbackCell
        cell.cosmosView.didTouchCosmos = { rating in
                 print("Rated: \(rating)")
             }
    }
}
