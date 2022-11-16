//
//  FeedbackQuestionListDataModel.swift
//  CO
//
//  Created by Rajesh Parimala on 03/11/22.
//

import Foundation
class FeedbackQuestionListDataModel : Codable {
    var error : Bool?
    var message : String?
    var sno : String?
    var question : String?
    var feedbackquestionslist : [FeedbackQuestionsList]?
}
class FeedbackQuestionsList : Codable {
    var sno : String?
    var question : String?
}
/*
 {
     "error": false,
     "message": "Data found",
     "sno": "sno",
     "question": "Question",
     "feedbackquestionslist": [
         {
             "sno": "1",
             "question": "Is the application easy to understand?"
         },
         {
             "sno": "2",
             "question": "Were you able to understand the features of the application?"
         },
         {
             "sno": "3",
             "question": "How is the speed and performance of the application?"
         },
         {
             "sno": "4",
             "question": "How easy is the application to use?"
         },
         {
             "sno": "5",
             "question": "How happy are you to use this application in your mobile?"
         }
     ]
 }
 */
