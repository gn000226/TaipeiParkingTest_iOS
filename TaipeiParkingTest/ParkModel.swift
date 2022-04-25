//
//  ParkModel.swift
//  TaipeiParkingTest
//
//  Created by 陳暘璿 on 2022/4/17.
//

import Foundation
import UIKit

struct ParkModel : Codable {
    
    enum CodingKeys : String, CodingKey {
        case data = "data"
    }
    let data : Data
    
    struct Data : Codable {
        enum CodingKeys : String, CodingKey {
            case time = "UPDATETIME"
            case park = "park"
        }
        let time : String
        let park : [ParkData]
    }
    
    struct ParkData : Codable {
        enum CodingKeys : String, CodingKey {
            case name = "name"
            case tel = "tel"
            case address = "address"
        }
        let name : String
        let tel : String
        let address : String
    }
    
}
