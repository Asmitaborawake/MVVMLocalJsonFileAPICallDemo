//
//  PostsViewModel.swift
//  DocplexusAssignment
//
//  Created by asmita.borawake on 02/11/18.
//  Copyright © 2018 asmita.borawake. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper

class PostsViewModel : NSObject{
    //MARK: Properties
    var postsModelClass = [PostsModelClass]()
    let filename = "posts"
    
    //MARK: Funcation
    func fetchCalendarYearData(completionHandler: @escaping ((Bool, String?) -> Swift.Void)) -> Void {
        
        //api call here
        WebServiceClass.shared.loadJson(fileName: filename) { (resonse, error) in
            if resonse != nil {
                print(resonse!)
                //mapping response to posts model
                self.postsModelClass = Mapper<PostsModelClass>().mapArray(JSONArray: resonse!)
                //sending result to call back
                completionHandler(true,error)
            }else{
                completionHandler(false, error)
            }
        }
        
        
    }
    //cell design for title & shorttext
    func infoTextForCell(postsData: PostsModelClass) -> NSMutableAttributedString {
        let informationString = NSMutableAttributedString()
        
        informationString.append(NSMutableAttributedString(string: "\(postsData.title)\n").addFontAttribute(font: UIFont(name: "HelveticaNeue-Bold", size: 15)!))
        
        informationString.append(NSMutableAttributedString(string: "\(postsData.shortBodyText)").addFontAttribute(font: UIFont(name: "HelveticaNeue-Light", size: 14)!))
        
        
        return informationString
    }
    //cell design for name
    func name(postName:PostsModelClass) -> NSMutableAttributedString{
        let informationString = NSMutableAttributedString()
        
        for name in postName.therapeutics{
            informationString.append(NSMutableAttributedString(string: "\(name.name)").addFontAttribute(font: UIFont(name: "HelveticaNeue-Bold", size: 13)!))
        }
        
        return informationString
    }
    
    
    
}
