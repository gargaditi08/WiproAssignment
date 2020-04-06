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
        let content = self.canadaUpdate?.rows[index]
        return content
        
    }
            
        
    }
    
 
