//
//  MyTeamLeaveModel.swift
//  HRMS
//
//  Created by Medicover Hospitals on 22/03/22.
//  Copyright © 2022 Medicover Hospitals. All rights reserved.
//

import Foundation
class MyTeamLeaveModel : Codable {
    var error:Bool?
    var message:String?
    var list:[MyTeamLeaveData]
}
class MyTeamLeaveData : Codable {
    var sno : String?
    var empid : String?
    var empname: String?
    var leave_type : String?
    var Applieddate : String?
    var fdate: String?
    var tdate : String?
    var days : String?
    var reason : String?
    var status : String?
    var isSelect:Bool?
   func set() {
          UserDefaults.standard.set(try? PropertyListEncoder().encode(self), forKey: "USER")
    }
    func get() -> MyTeamLeaveData? {
          if let data = UserDefaults.standard.value(forKey: "USER") as? Data{
              return try? PropertyListDecoder().decode(MyTeamLeaveData.self, from: data)
          }
          return nil
      }
}

/*
 {
     "error": false,
     "message": "Success!",
     "list": [
         {
             "sno": "248590",
             "empid": "019245",
             "empname": "Test",
             "leave_type": "Casual Leave",
             "Applieddate": "22/03/22",
             "fdate": "02/03/22",
             "tdate": "02/03/22",
             "days": "1",
             "reason": "Test",
             "status": "Applied"
         }
     ]
 }
 */
