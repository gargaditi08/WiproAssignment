//
//   UpdatesViewModel.swift
//  AssignmentWipro
//
//  Created by Aditi Garg on 06/04/20.
//  Copyright © 2020 Aditi Garg. All rights reserved.
//

import UIKit

internal final class UpdatesViewModel {
    
    var listService: TableListService = TableListService()
    var apiErrorOccured: ((_ message: String)->())?
    var reloadData: (()->())?
   // var rowDetails : [Rows] = []
    var canadaUpdate : CanadaUpdates?{
     didSet{
        self.reloadData?()
    }
      }
    init()  {
    }
    
    func getUpdateList(){
        self.listService.getDataList(requestCompletion: {
            (result, error) in

            if let canadaData = result {
                self.canadaUpdate = canadaData

            }else if let errorMessage = error{
                self.apiErrorOccured?(errorMessage)
            }
            
       })
    }
    
    
    var noOfRows : Int {
        if let object = self.canadaUpdate{
              return object.rows.count
        }
        return 0
    }
      
//
    func updateAtIndex(index:Int) -> Rows? {
      guard let content = self.canadaUpdate else {return nil}
        
        return content.rows[index]
        
    }
            
        
    }
    
 
