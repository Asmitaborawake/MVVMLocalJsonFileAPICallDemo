//
//  WebServiceClass.swift
//  DocplexusAssignment
//
//  Created by asmita.borawake on 02/11/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

public class WebServiceClass: NSObject {
    
    //MARK: Properties
    static let shared = WebServiceClass()
    
    //MARK: Funcation
    //load loacl json file api call
    func loadJson (fileName:String, completionHandler: @escaping (([[String:Any]]?,String?) -> Swift.Void)) -> Void {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let object = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let dictionary = object as? [[String: AnyObject]]{
                    print(dictionary)
                    completionHandler(dictionary,nil)
                }
            } catch {
                print("Error!! Unable to parse  \(fileName).json")
            }
        }
    }
   
}
