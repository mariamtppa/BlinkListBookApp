

import Foundation
class DataLoader {
//    func loadData() -> [BookData] {
//        if let fileLocation = Bundle.main.url(forResource: "jsonData", withExtension: "json") {
//            do {
//                let data = try Data(contentsOf: fileLocation)
//                let jsonDecoder = JSONDecoder()
//                let dataFromJson =  try jsonDecoder.decode([BookData].self, from: data)
//                return dataFromJson
//            } catch {
//                print(error)
//            }
//        }
//        return []
//    }
    
    //TODO:// Add function loadDataClosure
    func loadDataClosure(completionHanldler: ([BookData]) -> Void)  {
        if let fileLocation = Bundle.main.url(forResource: "jsonData", withExtension: "json") {
            do {
                let data = try Data(contentsOf: fileLocation)
                let jsonDecoder = JSONDecoder()
                let dataFromJson =  try jsonDecoder.decode([BookData].self, from: data)
                completionHanldler(dataFromJson)
            } catch {
                print(error)
            }
        }
    }
    
   // TODO:// Add function loadDataProtocol

}
