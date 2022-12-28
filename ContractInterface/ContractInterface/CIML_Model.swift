//
//  CIML_Model.swift
//  ContractInterface
//
//  Created by Quincy Jones on 12/28/22.
//

import Foundation
import SwiftUI
import Foundation
import Combine
// This file was generated from JSON Schema using quicktype, do not modify it directly.To parse the JSON, add this file to your project and do:   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

//{
//  "cimlVersion": "1.0.1",
//  "appVersion": "0.0.1",
//  "contractLanguage": "solidity ^0.8.10",
//  "name": "LedgerContract",
//  "symbol": "LC",
//  "logo": "https\\:ipfs.address.url.jpeg",
//  "thumbnail": "https\\:ipfs.address.url.jpeg",
//  "websitelink":"https\\:DAppletSite.com",
//  "ciml_url":"https\\:DAppletSite.com/ciml",
//  "description": "This is the description of the Dapp provided",
//  "networks":["XDC"],
//  "contractMainnet": ["xdcerG45fCgvgh&%vhvctcr678BB"],
//  "screenShots":[""],
//  "abi": "func1(uint _count)",
//  "byteCode": "--bytes--",
//  "variables": [
//    {
//      "name": "var1",
//      "type": "String",
//      "value": "this is an object"
//    }
//  ],
//  "functions": ["func1( _count)"],
//  "objects": [
//    {
//      "name": "text1",
//      "type": "Text",
//      "value": "var1"
//    }
//  ],
//  "views": [
//    {
//      "View": 0,
//      "type": "0",
//      "value": "Background(blue)",
//      "obj": "text1",
//      "location": 55
//    }
//  ],
//  "metadata": [
//    "Top Descriptor",
//    "xdc",
//    "document",
//    "test"
//  ]
//}


// MARK: - CIML
struct CIML: Codable,Identifiable {
        var id: String = UUID().uuidString
        var cimlVersion, appVersion, contractLanguage, name: String?
        var symbol, logo, thumbnail, description: String?
        var contractOrigin: String?
        var screenShots, variables, functions, objects: [String]?
        var views, metadata: [String]?
}

class DownloadCIMLDocument: ObservableObject {
    @Published var ciml: [CIML] = []
    
    var cancellables = Set<AnyCancellable>()
    init(){
        getCIML()
    }
    func getCIML(){
        guard let url = URL(string: "https://test-youtube-engine-xxxx.s3.amazonaws.com/CIML/Example.json") else { return }

        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap{ (data,response) -> JSONDecoder.Input in

                guard let response = response as? HTTPURLResponse,response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: [CIML].self, decoder: JSONDecoder())
            .sink { completion in
                if case .failure(let error) = completion {
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] returnedCIML in
                print("Completion: \(returnedCIML)")
                self?.ciml = returnedCIML
            }
            .store(in: &cancellables)
    }
}

struct Variable_Model:Identifiable {
    let id: String = UUID().uuidString
    let varName:String
    let type:String
    var inputvalue:[String]
    var outputvalue:[String]
}
struct Function_Model:Identifiable {
    let id: String = UUID().uuidString
    let funcName:String
    let type:String
    var inputValue:[String]
    var outputValue:[String]
}
struct CIMLText: Identifiable {
    let id: String = UUID().uuidString
    var text:String
    var foreGroundColor:Color = .black
    var font:Font = .headline
    var frame:[CGFloat] = [100,50]
    var alignment:Alignment = .center
    var backgroundColor:Color = .clear
    var cornerRadius:CGFloat = 0.0
    var bold:Bool = false
    var fontWeight:Font.Weight = .regular
    var shadow:CGFloat = 0.0
    var padding:CGFloat = 20
    var location:Int
}
struct CIMLTextField: Identifiable {
    let id: String = UUID().uuidString
    var text:String
    var textField:String = ""
    var foreGroundColor:Color = .gray
    var frame:[CGFloat] = [300,60]
    var alignment:Edge.Set = .horizontal
    var backgroundColor:Color = .white
    var cornerRadius:CGFloat = 10
    var shadow:CGFloat = 10
    var padding:CGFloat = 20
    var location:Int
}
struct CIMLSYSImage: Identifiable {
    let id: String = UUID().uuidString
    var name:String
    var frame:[CGFloat] = [50]
    var padding:CGFloat = 20
    var color:Color = .black
    var location:Int
  
}
struct CIMLButton: Identifiable {
    let id: String = UUID().uuidString
    var text:String
    var isIcon:Bool = false
    var foreGroundColor:Color = .black
    var font:Font = .headline
    var frame:[CGFloat] = [100,50]
    var alignment:Alignment = .center
    var backgroundColor:Color = .blue
    var cornerRadius:CGFloat = 10.0
    var bold:Bool = false
    var fontWeight:Font.Weight = .regular
    var shadow:CGFloat = 10.0
    var padding:CGFloat = 20
    var location:Int
}

struct CIML_Parser: Identifiable {
    let id: String = UUID().uuidString
    var Object1: any Identifiable
    var Object2: any Identifiable
    var Object3: any Identifiable
    var Object4: any Identifiable
    var Object5: any Identifiable
    var Object6: any Identifiable
    var Object7: any Identifiable
    var Object8: any Identifiable
    var Object9: any Identifiable
    var Object10: any Identifiable
    var Object11: any Identifiable
    var Object12: any Identifiable
    var Object13: any Identifiable
    var Object14: any Identifiable
    var Object15: any Identifiable
    var Object16: any Identifiable
    var Object17: any Identifiable
    var Object18: any Identifiable
    var Object19: any Identifiable
    var Object20: any Identifiable
    var Object21: any Identifiable
    var Object22: any Identifiable
    var Object23: any Identifiable
    var Object24: any Identifiable
    var Object25: any Identifiable
    var Object26: any Identifiable
    var Object27: any Identifiable
    var Object28: any Identifiable
    var Object29: any Identifiable
    var Object30: any Identifiable
    var Object31: any Identifiable
    var Object32: any Identifiable
    var Object33: any Identifiable
    var Object34: any Identifiable
    var Object35: any Identifiable
    var Object36: any Identifiable
    var Object37: any Identifiable
    var Object38: any Identifiable
    var Object39: any Identifiable
    var Object40: any Identifiable
    var Object41: any Identifiable
    var Object42: any Identifiable
    var Object43: any Identifiable
    var Object44: any Identifiable
    var Object45: any Identifiable
    var Object46: any Identifiable
    var Object47: any Identifiable
    var Object48: any Identifiable
    var Object49: any Identifiable
    var Object50: any Identifiable
}
