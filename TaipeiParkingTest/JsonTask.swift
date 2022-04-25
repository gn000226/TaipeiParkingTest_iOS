//
//  JsonTask.swift
//  TaipeiParkingTest
//
//  Created by 陳暘璿 on 2022/4/25.
//

import Foundation

class JsonTask {
    
    /** 取得json資料 */
    func readLocalFile(forName name: String) -> ParkModel? {
        // 1. 取得本地路徑 > 將路徑轉為URL
        guard let sourcesURL = Bundle.main.url(forResource: name, withExtension: "json") else {
                fatalError("error1")
            }
        // 2. 轉為Data格式
        guard let parkData = try? Data(contentsOf: sourcesURL) else {
                fatalError("error2")
            }
        // 3. 解析為 ParkModel 型別
            let decorder = JSONDecoder()
            guard let flatPark = try? decorder.decode(ParkModel.self, from: parkData) else { 
                fatalError("error3")
            }
        return flatPark
    }
}
